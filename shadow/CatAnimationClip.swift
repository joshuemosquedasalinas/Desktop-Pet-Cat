import AppKit

/// An immutable, named animation sequence ready to be driven by a behavior controller.
struct CatAnimationClip {

    /// Human-readable identifier. Examples: "idle", "idleBlink", "walk", "sit", "sleep"
    let name: String

    /// Ordered sequence of frames.
    let frames: [NSImage]

    /// Per-frame hold duration in seconds. Must equal `frames.count`.
    let frameDurations: [TimeInterval]

    var frameCount: Int { frames.count }
}

// MARK: - CatClips

/// A full set of animation clips for one cat color variant.
struct CatClips {
    let idle:      CatAnimationClip
    let idleBlink: CatAnimationClip
    let walk:      CatAnimationClip
    let sneak:     CatAnimationClip
    let run:       CatAnimationClip
    let dash:      CatAnimationClip
    let crouch:    CatAnimationClip
    let sit:       CatAnimationClip
    let lieDown:   CatAnimationClip
    let sleep:     CatAnimationClip
    let attack:    CatAnimationClip
    let fright:    CatAnimationClip
    let jump:      CatAnimationClip
    let fall:      CatAnimationClip
    let land:      CatAnimationClip
    let wallGrab:  CatAnimationClip
    let wallClimb: CatAnimationClip

    static func load(for variant: CatVariant) -> CatClips {
        func strip(_ asset: SpriteAsset, _ count: Int, _ durations: [TimeInterval]) -> CatAnimationClip {
            CatAnimationClip(
                name: asset.rawValue,
                frames: CatSpriteLoader.loadStrip(asset: asset, variant: variant, frameCount: count),
                frameDurations: durations
            )
        }

        return CatClips(
            idle:      strip(.idle,      CatAnimationConfig.Idle.frameCount,          CatAnimationConfig.Idle.frameDurations),
            idleBlink: strip(.idleBlink, CatAnimationConfig.Idle.Blink.frameCount,    CatAnimationConfig.Idle.Blink.frameDurations),
            walk:      strip(.walk,      CatAnimationConfig.Walk.frameCount,          CatAnimationConfig.Walk.frameDurations),
            sneak:     strip(.sneak,     CatAnimationConfig.Sneak.frameCount,         CatAnimationConfig.Sneak.frameDurations),
            run:       strip(.run,       CatAnimationConfig.Run.frameCount,           CatAnimationConfig.Run.frameDurations),
            dash:      strip(.dash,      CatAnimationConfig.Dash.frameCount,          CatAnimationConfig.Dash.frameDurations),
            crouch:    strip(.crouch,    CatAnimationConfig.Crouch.frameCount,        CatAnimationConfig.Crouch.frameDurations),
            sit:       strip(.sit,       CatAnimationConfig.Sit.frameCount,           CatAnimationConfig.Sit.frameDurations),
            lieDown:   strip(.lieDown,   CatAnimationConfig.LieDown.frameCount,       CatAnimationConfig.LieDown.frameDurations),
            sleep:     strip(.sleep,     CatAnimationConfig.Sleep.frameCount,         CatAnimationConfig.Sleep.frameDurations),
            attack:    strip(.attack,    CatAnimationConfig.Attack.frameCount,        CatAnimationConfig.Attack.frameDurations),
            fright:    strip(.fright,    CatAnimationConfig.Fright.frameCount,        CatAnimationConfig.Fright.frameDurations),
            jump:      strip(.jump,      CatAnimationConfig.Aerial.Jump.frameCount,   CatAnimationConfig.Aerial.Jump.frameDurations),
            fall:      strip(.fall,      CatAnimationConfig.Aerial.Fall.frameCount,   CatAnimationConfig.Aerial.Fall.frameDurations),
            land:      strip(.land,      CatAnimationConfig.Aerial.Land.frameCount,   CatAnimationConfig.Aerial.Land.frameDurations),
            wallGrab:  strip(.wallGrab,  CatAnimationConfig.WallGrab.frameCount,      CatAnimationConfig.WallGrab.frameDurations),
            wallClimb: strip(.wallClimb, CatAnimationConfig.WallClimb.frameCount,     CatAnimationConfig.WallClimb.frameDurations)
        )
    }
}
