import UIKit

protocol SnapshotViewMatcherProvider {
  func makeMatcher(with view: UIView, isRecording: Bool, tesTarget: TestTarget) -> ViewMatcher
}

struct SnapshotViewMatcher: ViewMatcher {

  private let view: UIView
  private let isRecording: Bool
  private let testTarget: TestTarget
  private let extractViewImage: ExtractViewImage
  private let compareImages: CompareImages
  
  init(view: UIView,
       isRecording: Bool = false,
       testTarget: TestTarget,
       extractViewImage: ExtractViewImage,
       compareImages: CompareImages)
  {
    self.view = view
    self.isRecording = isRecording
    self.testTarget = testTarget
    self.extractViewImage = extractViewImage
    self.compareImages = compareImages
  }

  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot")
  func toMatchSnapshot() {
    self.toMatchRecordedSnapshot()
  }

  func toMatchRecordedSnapshot() {
    toMatchRecordedSnapshot(named: nil)
  }

  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot")
  func toMatchSnapshot(for devices: [Device]) {
    self.toMatchRecordedSnapshot(for: devices)
  }

  func toMatchRecordedSnapshot(for devices: [Device]) {
    devices.forEach { device in
      self.toMatchRecordedSnapshot(named: nil, with: device)
    }
  }

  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot")
  func toMatchSnapshot(for allDevices: AllDevices) {
    self.toMatchRecordedSnapshot(for: allDevices)
  }

  func toMatchRecordedSnapshot(for allDevices: AllDevices) {
    var deviceList = [Device]()

    switch allDevices {
    case .allDevices:
      deviceList = allDevices.all
    case .iPhoneDevices:
      deviceList = allDevices.iphone
    case .iPadDevices:
      deviceList = allDevices.ipad
    }

    deviceList.forEach { device in
      self.toMatchRecordedSnapshot(named: nil, with: device)
    }
  }


  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot")
  func toMatchSnapshot(named: String?) {
    toMatchRecordedSnapshot(named: named, with: nil)
  }

  func toMatchRecordedSnapshot(named: String?) {
    toMatchRecordedSnapshot(named: named, with: nil)
  }
  
  private func toMatchRecordedSnapshot(named: String?,
                               with device: Device? = nil)
  {
    let updatedTestTarget = testTarget.named(named, with: device)
    let updatedView = self.view
    if let device = updatedTestTarget.device {
      updatedView.frame = CGRect(origin: .zero, size: device.size)
      updatedView.layoutIfNeeded()
    }
    guard isRecording else {
      compareImages.compare(with: updatedView, testTarget: updatedTestTarget)
      return
    }
    extractViewImage.execute(with: updatedView, testTarget: updatedTestTarget)
  }
}
