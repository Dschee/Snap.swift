import UIKit

protocol SnapshotLayerMatcherProvider {
  func makeMatcher(with layer: CALayer, isRecording: Bool, tesTarget: TestTarget) -> LayerMatcher
}

struct SnapshotLayerMatcher: LayerMatcher {
  
  private let layer: CALayer
  private let isRecording: Bool
  private let testTarget: TestTarget
  private let viewMatcherProvider: SnapshotViewMatcherProvider
  
  init(layer: CALayer,
       isRecording: Bool,
       testTarget: TestTarget,
       viewMatcherProvider: SnapshotViewMatcherProvider)
  {
    self.layer = layer
    self.isRecording = isRecording
    self.testTarget = testTarget
    self.viewMatcherProvider = viewMatcherProvider
  }

  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot")
  func toMatchSnapshot() {
    toMatchRecordedSnapshot()
  }

  func toMatchRecordedSnapshot() {
    toMatchRecordedSnapshot(named: nil)
  }

  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot(named:)")
  func toMatchSnapshot(named: String?) {
    self.toMatchRecordedSnapshot(named: named)
  }

  func toMatchRecordedSnapshot(named: String?) {
    let view = UIView(frame: layer.frame)
    view.layer.insertSublayer(layer, at: 0)

    viewMatcherProvider.makeMatcher(
      with: view,
      isRecording: isRecording,
      tesTarget: testTarget
    ).toMatchRecordedSnapshot(named: named)
  }
}
