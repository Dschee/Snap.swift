// MARK: - Matcher

public protocol Matcher: Nameable {
  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot")
  func toMatchSnapshot()
  func toMatchRecordedSnapshot()
}

public protocol ViewMatcher: Matcher, DeviceMatcher {}
public protocol LayerMatcher: Matcher {}

// MARK: - Matcher extensions

public protocol Nameable {
  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot(named:)")
  func toMatchSnapshot(named: String?)
  func toMatchRecordedSnapshot(named: String?)
}

public protocol DeviceMatcher {
  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot(for:)")
  func toMatchSnapshot(`for` devices: [Device])
  func toMatchRecordedSnapshot(`for` devices: [Device])
  @available(swift, deprecated: 4.1, renamed: "toMatchRecordedSnapshot(for:)")
  func toMatchSnapshot(`for` allDevices: AllDevices)
  func toMatchRecordedSnapshot(`for` allDevices: AllDevices)
}
