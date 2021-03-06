//
//  TempoSlider.swift
//  SimpleSequencer
//
//  Created by Joshua Escribano on 5/6/18.
//  Copyright © 2018 Joshua. All rights reserved.
//

import Foundation
import UIKit

/// Custom slider for adjusting the tempo
class TempoSlider: UIView {
    @IBOutlet weak var secondaryWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondaryView: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func commonInit() {
        let view = loadXib()
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.layer.cornerRadius = 15
        layer.cornerRadius = 15
        secondaryView.layer.cornerRadius = 14

        updateSliderConstraint()
    }

    private func updateSliderConstraint(_ width: CGFloat? = nil) {
        let w = width ?? bounds.width * CGFloat((AudioEngine.shared.tempo - AudioEngine.minTempo) / (AudioEngine.maxTempo - AudioEngine.minTempo))

        secondaryWidthConstraint.constant = -1 * (bounds.width - w)
        layoutIfNeeded()
    }

    @IBAction func didPanOnView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.location(in: self).x
        guard translation > 0, translation <= bounds.width else { return }
        
        let tempo = Double(translation / bounds.width) * (AudioEngine.maxTempo - AudioEngine.minTempo) + AudioEngine.minTempo
        AudioEngine.shared.tempo = tempo

        updateSliderConstraint(translation)
    }
    
}
