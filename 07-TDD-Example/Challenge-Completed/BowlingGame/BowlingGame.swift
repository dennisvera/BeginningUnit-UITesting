/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

class BowlingGame {
  
  private var rolls =  [Int](repeating: 0, count: 21)
  private var currentRoll = 0
  
  func role(_ pins: Int) {
    rolls[currentRoll] = pins
    currentRoll += 1
  }
  
  func score() -> Int {

    var score = 0
    var frameIndex = 0
    
    for _ in 1 ... 10 {
      
      if isStrike(frameIndex) {
        score += 10 + strikeBonus(frameIndex)
        frameIndex += 1
        
      } else if isSpare(frameIndex) {
        score += 10 + spareBonus(frameIndex)
        frameIndex += 2
        
      } else {
        score += rolls[frameIndex] + rolls[frameIndex + 1]
        frameIndex += 2
      }
    }
    return score
  }
  
  private func isStrike(_ frameIndex: Int) -> Bool {
    return rolls[frameIndex] == 10
  }
  
  private func strikeBonus(_ frameIndex: Int) -> Int {
    return rolls[frameIndex + 1] + rolls[frameIndex + 2]
  }
  
  private func isSpare(_ frameIndex: Int) -> Bool {
    return rolls[frameIndex] + rolls[frameIndex + 1] == 10
  }
  
  private func spareBonus(_ frameIndex: Int) -> Int {
    return rolls[frameIndex + 2]
  }
}
