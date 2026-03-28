table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "PoseidonWavesFix",
        label = "Poseidon Waves Fix",
        default = true,
        tooltip =
        "Fixes Poseidon waves on Axe special and Hidden Helix Torch."
    })
table.insert(apply_fns, {
    key = "PoseidonWavesFix",
    fn = function()
        if not TraitData.PoseidonSpecialBoon then return end
        backup(TraitData.PoseidonSpecialBoon.OnEnemyDamagedAction.Args, "MultihitProjectileWhitelist")
        backup(TraitData.PoseidonSpecialBoon.OnEnemyDamagedAction.Args, "MultihitProjectileConditions")
        local args = TraitData.PoseidonSpecialBoon.OnEnemyDamagedAction.Args
        table.insert(args.MultihitProjectileWhitelist, "ProjectileAxeSpecial")
        args.MultihitProjectileConditions.ProjectileAxeSpecial = { Count = 4, Window = 0.3 }
        args.MultihitProjectileConditions.ProjectileTorchOrbit.Count = 4
    end
})
