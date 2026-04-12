import AppKit

/// Loads and slices horizontal sprite strips into individual NSImage frames.
/// Knows nothing about timing, clips, or playback — pure asset ingestion.
enum CatSpriteLoader {

    /// Slices a horizontal sprite strip into `frameCount` equal-width frames.
    ///
    /// - Parameters:
    ///   - asset: The animation type to load.
    ///   - variant: The cat color variant to use.
    ///   - frameCount: Number of frames to extract from the strip.
    /// - Returns: Ordered array of NSImage frames, left → right. Empty on failure.
    static func loadStrip(asset: SpriteAsset, variant: CatVariant, frameCount: Int) -> [NSImage] {
        let assetName = asset.fileName(for: variant)
        guard
            let url = Bundle.main.url(forResource: assetName, withExtension: "png"),
            let source = NSImage(contentsOf: url)
        else {
            assertionFailure("CatSpriteLoader: could not load '\(assetName).png' from bundle.")
            return []
        }

        var proposedRect = NSRect(origin: .zero, size: source.size)
        guard
            let cgSource = source.cgImage(forProposedRect: &proposedRect, context: nil, hints: nil),
            frameCount > 0
        else {
            return []
        }

        let frameWidth  = cgSource.width / frameCount
        let frameHeight = cgSource.height

        return (0..<frameCount).compactMap { index in
            let rect = CGRect(
                x: index * frameWidth,
                y: 0,
                width: frameWidth,
                height: frameHeight
            )
            guard let cropped = cgSource.cropping(to: rect) else { return nil }
            return NSImage(
                cgImage: cropped,
                size: NSSize(width: frameWidth, height: frameHeight)
            )
        }
    }
}
