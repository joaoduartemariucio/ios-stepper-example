//
//  ViewCode.swift
//  ios-stepper-example
//
//  Created by João Vitor Duarte Mariucio on 26/08/22.
//
// This code was found in https://gist.github.com/ccal2/048f1e609b1343025a2a6ec2db8fa9f9

import Foundation

// MARK: - ViewCode

protocol ViewCode {
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
}
