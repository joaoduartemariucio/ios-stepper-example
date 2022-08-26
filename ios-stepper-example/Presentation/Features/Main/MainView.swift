//
//  MainView.swift
//  ios-stepper-example
//
//  Created by João Vitor Duarte Mariucio on 26/08/22.
//

import SnapKit
import UIKit

class MainView: UIView, ViewCode {
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

    let steperView: StepperView = .init(frame: .zero)
    let changeStateButton: UIButton = .init(type: .system)

    func buildViewHierarchy() {
        addSubview(steperView)
        addSubview(changeStateButton)
    }

    func setupContraints() {
        steperView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(70)
        }

        changeStateButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .lightGray
        changeStateButton.setTitle("Change state", for: .normal)
    }
}
