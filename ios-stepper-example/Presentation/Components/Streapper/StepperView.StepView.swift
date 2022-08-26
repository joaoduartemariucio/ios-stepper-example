//
//  StepView.swift
//  ios-stepper-example
//
//  Created by João Vitor Duarte Mariucio on 26/08/22.
//

import SnapKit
import UIKit

extension StepperView {
    class StepView: UIView, ViewCode {
        // MARK: Lifecycle

        init(state: State) {
            self.state = state
            super.init(frame: .zero)
            setupView()
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: Public

        public var state: State {
            didSet {
                updateState()
            }
        }

        // MARK: Internal

        enum State {
            case next
            case current
            case completed

            // MARK: Internal

            var image: UIImage? {
                switch self {
                case .next:
                    return UIImage(named: "icone_3")
                case .current:
                    return UIImage(named: "icone_2")
                case .completed:
                    return UIImage(named: "icone_1")
                }
            }
        }

        func buildViewHierarchy() {
            addSubview(stateImageView)
        }

        func setupContraints() {
            stateImageView.snp.makeConstraints { make in
                make.height.equalTo(16)
                make.width.equalTo(16)
                make.center.equalToSuperview()
            }
        }

        func setupAdditionalConfiguration() {
            updateState()
        }

        func updateState() {
            stateImageView.image = state.image
        }

        func setState(_ state: State, animated: Bool = true) {
            if animated {
                UIView.animate(
                    withDuration: 0.50,
                    delay: 0,
                    options: .curveEaseInOut,
                    animations: { [weak self] in
                        self?.alpha = 0
                        self?.state = state
                        self?.alpha = 1
                    }
                )

            } else {
                self.state = state
            }
        }

        // MARK: Private

        private let stateImageView: UIImageView = .init()
    }
}
