#
# == Define: shortcut::file
#
# Setup a shortcut file
#
# == Parameters
#
# [*user*]
#   The system user to add this desktop file for.
# [*command*]
#   The command this shortcut runs.
# [*icon*]
#   Name of the icon to use. Does not have to be a fully-qualified path.
# [*ensure*]
#   Ensure the resource is 'present' (default) or 'absent'.
# [*filename*]
#   Basename of the desktop file. Defaults to $title. Omit the .desktop 
#   extension.
# [*comment*]
#   Optional free-form comment/description for the desktop file.
# [*terminal*]
#   Determine if the command should be run in a terminal. Valid values 'true' 
#   and 'false' (default).
# [*type*]
#   Type of the desktop file. Defaults to 'Application'.
#
define shortcut::file
(
    $user,
    $command,
    $icon,
    $ensure = 'present',
    $filename = $title,
    $comment = undef,
    $terminal = false,
    $type = 'Application'

)
{

    file { $filename:
        ensure  => $ensure,
        name    => "${::os::params::home}/${user}/.local/share/applications/${filename}.desktop",
        content => template('shortcut/file.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
    }

}
