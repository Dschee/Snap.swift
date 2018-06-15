import UIKit
import XCTest

// MARK: - XCTestCase + CALayer Expectation

extension XCTestCase {
  @available(swift, obsoleted: 4.1, renamed: "expectSnapshot(_:function:file:)")
  public func expect(_ layer: CALayer, function: String = #function, file: String = #file ) -> LayerMatcher {
    return self.expectSnapshot(layer, function: function, file: file)
  }

  public func expectSnapshot(_ layer: CALayer, function: String = #function, file: String = #file ) -> LayerMatcher {
    let testTarget = TestTarget(
      function: function,
      file: file
    )
    layer.layoutIfNeeded()

    return resolver.makeMatcher(
      with: layer,
      isRecording: isRecording,
      tesTarget: testTarget
    )
  }
}
