# == Class: shortcut
#
# This class sets up desktop (shortcut) files
#
# == Parameters
#
# [*manage*]
#   Whether to manage desktop files using this class or not. Valid values are 
#   'yes' (default) and 'no'.
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
    $manage = 'yes',
    $files = {}

) inherits shortcut::params
{

if $manage == 'yes' {

    create_resources('shortcut::file', $files)

}
}
