# sw6-license-updater

Simple bash script to quickly upgrade your systemConfig variables for SwagCommercial

## How to config?

At first, open the `.config` file and configure the three variables necessary:

- `SHOPWARE_PATH`: The path to your shopware instance
- `LICENSE_HOST`: The license host to be added into your SW6 database. Mostly `localhost` suffices here
- `LICENSE_TOGGLES`: A JSON blob to know which feature toggles to register within the SBP

## How to use?

After setting up the variables mentioned above this command will do the trick:

```bash
bash .license.sh
```

Of course, adding it your `.bashrc` / `.zshrc` via stuff like following or add it to your `PATH` makes it even more comfortable:

```bash
alias addlicenses="bash ~/Code/sw6-license-updater/license.sh"
```

The only prompt you'll be receiving will asking for the `Shopware-X` token, you get via the SBP. After that, you're already done.