// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXWKExtension",
	platforms: [.iOS("13.0"), .watchOS("9.0")],
	products: [
		.library(
			name: "GXWKExtension",
			targets: ["GXWKExtensionWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-rc.8"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "3.0.0-rc.8")
	],
	targets: [
		.target(name: "GXWKExtensionWrapper",
				dependencies: [
					"GXWKExtension",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.watchOS])),
					.product(name: "GXUIApplication", package: "GXUIApplication", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXWKExtension",
			url: "https://pkgs.genexus.dev/iOS/preview/GXWKExtension-3.0.0-rc.8.xcframework.zip",
			checksum: "0108563e0c932e32ce5c532656cabb22c4936a0437f3abde93fb0e65c63ff173"
		)
	]
)