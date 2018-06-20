# RswiftStringTransform
Scripts for transforming `NSLocalizedString(_:comment:)` calls to Rswift string resource, based on https://gist.github.com/Lutzifer/3e7d967f73e38b57d4355f23274f303d

I hacked this real quick and hope it might be useful for anybody. This should successfully convert most `NSLocalizedString` to `R.string.localized` calls if you use ASCII keys for your localizables.

Usage: `sh replaceNSlocalized.sh`
