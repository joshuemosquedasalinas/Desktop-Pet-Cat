/// Compile-time registry of every animation type, independent of cat color.
///
/// Raw values are the animation portion of the filename (e.g. "idle_strip8").
/// Call `fileName(for:)` to get the full PNG name for a specific variant.
enum SpriteAsset: String {
    case idle         = "idle_strip8"
    case idleBlink    = "idle_blink_strip8"
    case walk         = "walk_strip8"
    case sneak        = "sneak_strip8"
    case run          = "run_strip4"
    case dash         = "dash_strip9"
    case crouch       = "crouch_strip8"
    case sit          = "sit_strip8"
    case lieDown      = "liedown_strip24"
    case sleep        = "sleep_strip8"
    case attack       = "attack_strip7"
    case fright       = "fright_strip8"
    case jump         = "jump_strip4"
    case fall         = "fall_strip3"
    case land         = "land_strip2"
    case wallGrab     = "wallgrab_strip8"
    case wallClimb    = "wallclimb_strip8"

    func fileName(for variant: CatVariant) -> String {
        "cat\(variant.rawValue)_\(rawValue)"
    }
}
