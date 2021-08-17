// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import FacebookGamingServices
import Foundation
import UIKit

enum CustomUpdateContentObjects {

  // swiftlint:disable force_unwrapping
  static var validID = "12345"
  static var validMessage = "Hello"
  static var gifMedia = FacebookGIF(withUrl: URL(string: "www.test.com")!)
  @available(iOS 13.0, *)
  static var validImage = UIImage(
    named: "customColorSilhouette",
    in: Bundle(for: CustomUpdateGraphAPIContentRemoteTests.self),
    with: nil)!

  @available(iOS 13.0, *)
  static let imageContentInvalidContextID = {
    return CustomUpdateContentImage(
      contextTokenID: "",
      message: validMessage,
      image: validImage)
  }

  @available(iOS 13.0, *)
  static let imageContentInvalidMessage = {
    return CustomUpdateContentImage(
      contextTokenID: validID,
      message: "",
      image: validImage)
  }

  static let imageContentInvalidImage = {
    return CustomUpdateContentImage(
      contextTokenID: validID,
      message: validMessage,
      image: UIImage()
    )
  }

  @available(iOS 13.0, *)
  static let imageContentValid = {
    return CustomUpdateContentImage(
      contextTokenID: validID,
      message: validMessage,
      image: validImage)
  }

  static let mediaContentInvalidContextID = {
    return CustomUpdateContentMedia(
      contextTokenID: "",
      message: validMessage,
      media: gifMedia)
  }

  static let mediaContentInvalidMessage = {
    return CustomUpdateContentMedia(
      contextTokenID: validID,
      message: "",
      media: gifMedia)
  }

  static let mediaContentInvalidMedia = {
    return CustomUpdateContentMedia(
      contextTokenID: validID,
      message: validMessage,
      media: gifMedia)
  }

  static let mediaContentValid = {
    return CustomUpdateContentMedia(
      contextTokenID: validID,
      message: validMessage,
      media: gifMedia)
  }

}

enum CustomUpdateContentObjectsParameters {
  static let contextKEY = "context_token_id"
  static let textKey = "text"
  static let mediaKey = "media"
  static let imageKey = "image"

  static let contextValue = "12345"
  static let textValue = "{\"default\":\"Hello\",\"localizations\":{}}"
  static let mediaValue = "{\"gif\":{\"url\":\"www.test.com\"}}"
  static let imageValue = "data:image/png;base64,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"  // swiftlint:disable:this line_length
}
