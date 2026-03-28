table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "BraidFix",
        label = "Braid Fix",
        default = true,
        tooltip =
        "Fixes Braid of Atlas to properly buff casts."
    })
table.insert(apply_fns, {
    key = "BraidFix",
    fn = function()
        if not TraitData.TemporaryImprovedCastTrait then return end
        backup(TraitData.TemporaryImprovedCastTrait.AddOutgoingDamageModifiers, "ValidProjectiles")
        backup(TraitData.TemporaryImprovedCastTrait.AddOutgoingDamageModifiers, "WeaponOrProjectileRequirement")
        TraitData.TemporaryImprovedCastTrait.AddOutgoingDamageModifiers.ValidProjectiles = WeaponSets
            .CastProjectileNames
        TraitData.TemporaryImprovedCastTrait.AddOutgoingDamageModifiers.WeaponOrProjectileRequirement = true
    end
})
