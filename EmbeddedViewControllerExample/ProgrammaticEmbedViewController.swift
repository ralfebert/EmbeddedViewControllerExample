import UIKit

class ProgrammaticEmbedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let headlineVC = self.storyboard!.instantiateViewController(withIdentifier: "Headline")
        let vc2 = self.storyboard!.instantiateViewController(withIdentifier: "Collection")

        embed(headlineVC, constraintsBlock: { (subview: UIView, container: UIView) in
            let containerSafeArea = container.safeAreaLayoutGuide
            return [subview.topAnchor.constraint(equalTo: containerSafeArea.topAnchor),
                    subview.leadingAnchor.constraint(equalTo: containerSafeArea.leadingAnchor),
                    subview.trailingAnchor.constraint(equalTo: containerSafeArea.trailingAnchor)]
        })

        embed(vc2, constraintsBlock: { (subview: UIView, container: UIView) in
            let containerSafeArea = container.safeAreaLayoutGuide
            return [subview.topAnchor.constraint(equalTo: headlineVC.view.bottomAnchor),
                    subview.leadingAnchor.constraint(equalTo: containerSafeArea.leadingAnchor),
                    subview.trailingAnchor.constraint(equalTo: containerSafeArea.trailingAnchor),
                    subview.heightAnchor.constraint(equalToConstant: 150)]
        })

    }
    
    func embed(_ viewController: UIViewController, constraintsBlock: (UIView, UIView) -> [NSLayoutConstraint]) {
        guard let subview = viewController.view else { return }

        addChild(viewController)
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewController.view)
        NSLayoutConstraint.activate(constraintsBlock(subview, view))
        viewController.didMove(toParent: self)
    }

}
