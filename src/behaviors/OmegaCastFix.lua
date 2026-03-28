table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "OmegaCastFix",
        label = "Omega Cast Fix",
        default = true,
        tooltip =
        "Fixes OCast moves not counting as cast damage."
    })
table.insert(apply_fns, {
    key = "OmegaCastFix",
    fn = function()
        backup(WeaponSets, "CastProjectileNames")
        local missingCastProjectiles = {
            "ApolloCastRapid",
            "AresProjectile",
            "ZeusApolloSynergyStrike",
            "DemeterCastStorm",
            "AthenaCastProjectile",
        }
        for _, projectileName in ipairs(missingCastProjectiles) do
            table.insert(WeaponSets.CastProjectileNames, projectileName)
        end
    end
})
