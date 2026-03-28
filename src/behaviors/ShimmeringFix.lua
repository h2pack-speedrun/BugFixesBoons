table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "ShimmeringFix",
        label = "Shimmering Moonshot Fix",
        default = true,
        tooltip =
        "Fixes Shimmering Moonshot not applying damage bonus to omega special."
    })
table.insert(apply_fns, {
    key = "ShimmeringFix",
    fn = function()
        if not TraitData.StaffJumpSpecialTrait then return end
        backup(TraitData.StaffJumpSpecialTrait.AddOutgoingDamageModifiers, "ProjectileName")
        backup(TraitData.StaffJumpSpecialTrait.AddOutgoingDamageModifiers, "ValidProjectiles")
        backup(TraitData.StaffJumpSpecialTrait, "PropertyChanges")
        TraitData.StaffJumpSpecialTrait.AddOutgoingDamageModifiers.ProjectileName = nil
        TraitData.StaffJumpSpecialTrait.AddOutgoingDamageModifiers.ValidProjectiles = { "ProjectileStaffBall",
            "ProjectileStaffBallCharged" }
        for _, propertyChange in ipairs(TraitData.StaffJumpSpecialTrait.PropertyChanges) do
            propertyChange.ProjectileNames = { "ProjectileStaffBall", "ProjectileStaffBallCharged" }
        end
    end
})
