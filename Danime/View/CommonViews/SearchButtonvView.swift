//
//  HomeSearchButtonvView.swift
//  Danime
//
//  Created by Dias Gazim on 26.11.2022.
//

import Foundation
import SnapKit


final class ButtonWithBackgroundImage: UIButton {
    private var symbolName: String? = nil
    
    lazy var background: UIImage =  {
        let backImg = UIImage(systemName: "magnifyingglass")
        return backImg!
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundImage(background, for: UIControl.State.normal)
    }
    
    func setSymbolName(name: String) {
        symbolName = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init() shit")
    }
}
