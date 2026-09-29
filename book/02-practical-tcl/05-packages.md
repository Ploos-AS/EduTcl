# 5 — Packages and package require

`source` loads a file. Tcl's package system lets code request a named capability with a version.

```tcl
package provide edutcl::greet 1.0

namespace eval ::edutcl::greet {
    proc hello {nick} {
        return "Hello, $nick"
    }
}
```

A caller can request it:

```tcl
package require edutcl::greet 1.0
```

## Package identity

A package name and version form an interface contract. File names and package names do not have to be identical.

## Finding packages

Tcl searches paths represented by `auto_path`. Package index files tell Tcl how a package can be loaded. We will use `pkg_mkIndex` in a lab, then discuss when generated versus maintained indexes make sense.

## Versioning

Do not change a public API casually just because Tcl makes it easy to redefine commands. A package version should communicate compatibility expectations.

## Eggdrop connection

Eggdrop scripts often begin as files loaded by configuration. Larger reusable components benefit from explicit package boundaries even when Eggdrop remains the host process.

## Exercise

Turn a namespace from the previous lab into a package and load it from a separate program with `package require`.
