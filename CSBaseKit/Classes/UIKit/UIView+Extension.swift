
import UIKit

// MARK: - 设置Frame
public extension UIView {
    
    var width: CGFloat {
        get { return self.frame.size.width }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }

    var height: CGFloat {
        get { return self.frame.size.height }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var size: CGSize  {
        get { return self.frame.size }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }

    var origin: CGPoint {
        get { return self.frame.origin }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var y: CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get { return self.center.x }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get { return self.center.y }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    var top : CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var bottom : CGFloat {
        get { return frame.origin.y + frame.size.height }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right : CGFloat {
        get { return self.frame.origin.x + self.frame.size.width }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    var left : CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x  = newValue
            self.frame = frame
        }
    }
}

// MARK: - 设置圆角、边框
public extension UIView {
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor ??
                UIColor.white.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
}

fileprivate let retryActionSaveKey = "__tipview_retryAction"
fileprivate let tipViewSaveKey = "__tipview"

// MARK: - TipView
public extension UIView {
    
    /// 展示tipView
    func showTipView(_ tipView : UIView, retryAction : (()->Void)? = nil) {
        // 移除现有的视图
        self.currentTipView?.removeFromSuperview()
        self.currentTipView = tipView
        // 持有回调数据
        self.retryAction = retryAction
        
        tipView.frame = self.bounds
        self.addSubview(tipView)
        
        if self.retryAction != nil {
            let tap = UITapGestureRecognizer(target: self, action: #selector(didClickTipView))
            tipView.addGestureRecognizer(tap)
        }
    }
    
    /// 移除提示view
    func removeTipView(){
        if let currentTipView = self.currentTipView {
            currentTipView.removeFromSuperview()
            self.currentTipView = nil
        }
    }
    
    // 当前展示的视图
    var currentTipView: UIView? {
        get {
            objc_getAssociatedObject(self, tipViewSaveKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, tipViewSaveKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    // 点击事件
    private var retryAction : (()->Void)? {
        get {
            objc_getAssociatedObject(self, retryActionSaveKey) as? () -> Void
        }
        set {
            objc_setAssociatedObject(self, retryActionSaveKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    // 点击提示视图
    @objc func didClickTipView(){
        self.removeTipView() // 先移除提示视图,再进行回调
        if let retryAction = self.retryAction {
            retryAction()
        }
    }
}
