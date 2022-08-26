//
//  ViewController.swift
//  ios-stepper-example
//
//  Created by João Vitor Duarte Mariucio on 25/08/22.
//

import UIKit

// MARK: - MainViewController

class MainViewController: UIViewController {
    // MARK: Lifecycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.steperView.steps = steps

        mainView.changeStateButton.addTarget(
            self,
            action: #selector(changeStateButtonTapped),
            for: .touchUpInside
        )
    }

    // MARK: Internal

    var steps: [StepperView.StepView] = [
        .init(state: .completed),
        .init(state: .completed),
        .init(state: .current),
        .init(state: .next)
    ]

    @objc func changeStateButtonTapped() {
        steps.last?.setState(.completed)
    }

    // MARK: Private

    private let mainView = MainView()
}
