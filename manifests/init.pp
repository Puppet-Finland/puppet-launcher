# == Class: shortcut
#
# This class sets up desktop (shortcut) files
#
# == Parameters
#
# [*manage*]
#   Whether to manage desktop files using this class or not. Valid values are 
#   true (default) and false.
# [*files*]
#   A hash of shortcut::file resources to realize.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class shortcut
(
    $manage = true,
    $files = {}

) inherits shortcut::params
{

    validate_bool($manage)
    validate_hash($files)

    if $manage {
        create_resources('shortcut::file', $files)
    }
}
