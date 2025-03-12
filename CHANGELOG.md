# Changelog

## 1.0.0 (2025-03-12)


### Features

* **config:** add log configs ([ed23526](https://github.com/S1M0N38/ctx.nvim/commit/ed23526997762bf9ff17cf10d9411bdc92a4282b))
* **health:** add checkhealth for ctx.nvim ([bc30b63](https://github.com/S1M0N38/ctx.nvim/commit/bc30b633fb20063ff717c0ffc64d1a54f3e19800))
* **init:** implement qf/loc list to markdown main functions ([1f08a3a](https://github.com/S1M0N38/ctx.nvim/commit/1f08a3a5125b76b59477141ff5ff169eb1dd626b))
* **items:** add breadcrumbs to selection item ([d0d9a79](https://github.com/S1M0N38/ctx.nvim/commit/d0d9a79c662e6afa5f8b1f0719112dc4477cd70c))
* **items:** add selection to items ([adf8c09](https://github.com/S1M0N38/ctx.nvim/commit/adf8c09ec2e1e2b4fd2322c0126051f31f39e4e2))
* **items:** simplify the selection item ([408be4a](https://github.com/S1M0N38/ctx.nvim/commit/408be4a46cbd1acd6b5ad46784c2d87026baaf0a))
* **parse:** add function for parse a generic item ([32537eb](https://github.com/S1M0N38/ctx.nvim/commit/32537ebd188e6220fdd5b00b4ce5408e9aacc742))
* **parse:** add function for parsing various types (wip) ([4764158](https://github.com/S1M0N38/ctx.nvim/commit/476415802264be9e77260275517091f3ea2c05e5))
* **parse:** implement parsing of diagnostic item ([4f27a7d](https://github.com/S1M0N38/ctx.nvim/commit/4f27a7df67de63426d3791b6cc17d6b387ec2401))
* **parse:** implement selection parsing function ([dd63026](https://github.com/S1M0N38/ctx.nvim/commit/dd63026d07cba5aa2a1b5adfc076ba5736dcecde))
* **parse:** implemented parse file ([de8b12b](https://github.com/S1M0N38/ctx.nvim/commit/de8b12b0179fe1a5d7d48d39efc6405ab90138c8))
* **types:** update item type using snacks def ([ffe3452](https://github.com/S1M0N38/ctx.nvim/commit/ffe3452ec28904198d9e4c693a61fd0557854c93))
* **utils:** add highlight item to utils ([4d0f9c8](https://github.com/S1M0N38/ctx.nvim/commit/4d0f9c83180d69952762c7f138d74d07c5040529))


### Bug Fixes

* **config:** move logger configuration into config.setup ([f668515](https://github.com/S1M0N38/ctx.nvim/commit/f668515cb88835f8ffd0a5c3efe6082a2a0e6de9))
* **log:** update log initialization ([4d53893](https://github.com/S1M0N38/ctx.nvim/commit/4d53893f398b325b8716632f94ef92b47e44fe62))
* **log:** use vim.notify instead of echohl ([cd329e2](https://github.com/S1M0N38/ctx.nvim/commit/cd329e244c7272b4f30cb6fdbe5ef8bd25bfad5c))
* **parse:** off-by-one in diagnostics parse ([15eadb2](https://github.com/S1M0N38/ctx.nvim/commit/15eadb29c7cd955d9db850e8fe66c8041ee4ccd7))
* **test:** disable type annotation for rglob lines ([4da8715](https://github.com/S1M0N38/ctx.nvim/commit/4da8715cb86a55c07687d32dd33a101cc44f15f3))
* **types:** adjust types to new simpler selection item and fix log level ([7e98203](https://github.com/S1M0N38/ctx.nvim/commit/7e982033dbaea131aa59ebef0819c1935e6bf59f))
* **types:** restrict highlight to Ctx.Items.Selection ([8765dec](https://github.com/S1M0N38/ctx.nvim/commit/8765dec00b4017b0498ea0d93a2eb8c98e1254e4))
