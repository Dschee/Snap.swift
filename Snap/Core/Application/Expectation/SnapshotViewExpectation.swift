import UIKit
import XCTest

// MARK: - XCTestCase + View Expectation

extension XCTestCase {
  @available(swift, obsoleted: 4.1, renamed: "expectSnapshot(_:function:file:)")
  public func expect(_ view: UIView, function: String = #function, file: String = #file ) -> ViewMatcher {
    return self.expectSnapshot(view, function: function, file: file)
  }

  @available(swift, obsoleted: 4.1, renamed: "expectSnapshot(_:function:file:)")
  public func expect(_ viewController: UIViewController, function: String = #function, file: String = #file ) -> ViewMatcher {
    return self.expectSnapshot(viewController.view, function: function, file: file)
  }

  public func expectSnapshot(_ view: UIView, function: String = #function, file: String = #file ) -> ViewMatcher {
    let testTarget = TestTarget(
      function: function,
      file: file
    )
    view.layoutIfNeeded()

    return resolver.makeMatcher(
      with: view,
      isRecording: isRecording,
      tesTarget: testTarget
    )
  }

  public func expectSnapshot(_ viewController: UIViewController, function: String = #function, file: String = #file ) -> ViewMatcher {
    return self.expectSnapshot(viewController.view, function: function, file: file)
  }
}
