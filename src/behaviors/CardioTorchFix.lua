table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "CardioTorchFix",
        label = "Cardio Torch Fix",
        default = true,
        tooltip =
        "Fixes Cardio Gain interactions with Torch specials."
    })
table.insert(apply_fns, {
    key = "CardioTorchFix",
    fn = function()
        if not TraitData.HestiaManaBoon then return end
        backup(TraitData.HestiaManaBoon.OnEnemyDamagedAction.Args, "MultihitProjectileWhitelist")
        backup(TraitData.HestiaManaBoon.OnEnemyDamagedAction.Args, "MultihitProjectileConditions")
        local args = TraitData.HestiaManaBoon.OnEnemyDamagedAction.Args
        table.insert(args.MultihitProjectileWhitelist, "ProjectileTorchOrbit")
        args.MultihitProjectileConditions.ProjectileTorchOrbit = { Cooldown = 0.01 }
    end
})
