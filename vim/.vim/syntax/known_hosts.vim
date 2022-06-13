
Skip to content
Pull requests
Issues
Marketplace
Explore
@libert-xyz
pix /
vim-known_hosts
Public

Code
Issues
Pull requests
Actions
Projects
Wiki
Security

    Insights

vim-known_hosts/syntax/known_hosts.vim
@ab
ab Add support for more SSH 2.0 key types.
Latest commit c89ed7f on Jan 18, 2016
History
2 contributors
@pix
@ab
47 lines (39 sloc) 1.22 KB
" Vim syntax file
"
" Language:     OpenSSH known_hosts (known_hosts)
" Author:       Camille Moncelier <moncelier@devlife.org>
" Copyright:    Copyright (C) 2010 Camille Moncelier <moncelier@devlife.org>
" Licence:      You may redistribute this under the same terms as Vim itself
"
" This sets up the syntax highlighting for known_host file

" Setup
if version >= 600
    if exists("b:current_syntax")
        finish
    endif
else
    syntax clear
endif

if version >= 600
    setlocal iskeyword=_,-,a-z,A-Z,48-57
else
    set iskeyword=_,-,a-z,A-Z,48-57
endif

syn case ignore

syn keyword knownHostsKeyword ssh-rsa ssh-dsa ssh-dss ecdsa-sha2-nistp256 ecdsa-sha2-nistp384 ecdsa-sha2-nistp521 ssh-ed25519
syn match   knownHostsHost    "^[^ ]\+" 
syn match   knownHostsKey     "[^ ]\+$"

" Define the default highlighting
if version >= 508 || !exists("did_known_hosts_syntax_inits")
    if version < 508
        let did_sshconfig_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink knownHostsKeyword Keyword
    HiLink knownHostsHost    Identifier
    HiLink knownHostsKey     String

    delcommand HiLink
endif

let b:current_syntax = "known_hosts"

    © 2022 GitHub, Inc.

    Terms
    Privacy
    Security
    Status
    Docs
    Contact GitHub
    Pricing
    API
    Training
    Blog
    About

Loading complete
