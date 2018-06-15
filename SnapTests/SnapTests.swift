import XCTest
import UIKit

private final class SnapTests: XCTestCase {
  
  override func setUp() {
     // isRecording = true
  }
  
  func test_box_with_background_color() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .red
    
    expectSnapshot(view).toMatchRecordedSnapshot()
  }
  
  func test_box_with_text_aligned_to_center() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .red
    
    let label = UILabel(frame: view.bounds)
    label.text = "Snap!"
    label.textAlignment = .center
    view.addSubview(label)
   
    expectSnapshot(view).toMatchRecordedSnapshot()
  }
  
  func test_box_with_gradient_layer() {
    let layer = CAGradientLayer()
    layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    layer.colors = [
      UIColor.red.cgColor,
      UIColor.white.cgColor
    ]
    layer.locations = [0.0, 1.0]
    layer.startPoint = CGPoint(x: 0.0, y: 1.0)
    layer.endPoint = CGPoint(x: 0.0, y: 1.0)

    expectSnapshot(layer).toMatchRecordedSnapshot()
  }
  
  func test_box_with_custom_name() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.backgroundColor = .yellow
    
    expectSnapshot(view).toMatchRecordedSnapshot(named: "yellow_box")
  }
 
  func test_box_with_all_device_configurations() {
    let view = UIView()
    view.backgroundColor = .green
    
    expectSnapshot(view).toMatchRecordedSnapshot(for: .allDevices)
  }
  
  func test_box_with_iphone_device_configurations() {
    let view = UIView()
    view.backgroundColor = .gray
    
    expectSnapshot(view).toMatchRecordedSnapshot(for: .iPhoneDevices)
  }
  
  func test_box_with_ipad_device_configurations() {
    let view = UIView()
    view.backgroundColor = .purple
    
    expectSnapshot(view).toMatchRecordedSnapshot(for: .iPadDevices)
  }
}
