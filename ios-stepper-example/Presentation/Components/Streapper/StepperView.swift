//
//  StepperView.swift
//  ios-stepper-example
//
//  Created by João Vitor Duarte Mariucio on 26/08/22.
//

import SnapKit
import UIKit

class StepperView: UIView, ViewCode {
    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal

    var steps: [StepView] = .init() {
        didSet {
            updateSteps()
        }
    }

    var streapperColor: UIColor = .init(red: 0.19, green: 0.20, blue: 0.21, alpha: 1.00) {
        didSet {
            updateColors()
        }
    }

    func buildViewHierarchy() {
        addSubview(centerLineView)
        addSubview(mainStack)
    }

    func setupContraints() {
        centerLineView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(2)
            make.centerY.equalToSuperview()
        }

        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        updateSteps()
        updateColors()
    }

    func updateColors() {
        centerLineView.backgroundColor = streapperColor
    }

    func updateSteps() {
        mainStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        steps.forEach { mainStack.addArrangedSubview($0) }
    }

    // MARK: Private

    private let mainStack: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .horizontal
        view.contentMode = .scaleToFill
        view.distribution = .fillEqually
        return view
    }()

    private let centerLineView: UIView = .init()
}
