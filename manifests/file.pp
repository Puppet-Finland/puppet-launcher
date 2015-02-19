#
# == Define: shortcut::file
#
# Setup a shortcut file
#
# == Parameters
#
# [*ensure*]
#   Ensure the resource is 'present' (default) or 'absent'.
# [*filename*]
#   Basename of the desktop file. Defaults to $title. Omit the .desktop 
#   extension.
# [*user*]
#   The system user to add this desktop file for.
# [*comment*]
#   Optional free-form comment/description for the desktop file.
# [*icon*]
#   Name of the icon to use. Does not have to be a fully-qualified path.
# [*terminal*]
#   Determine if the command should be run in a terminal. Valid values 'true' 
#   and 'false' (default).
# [*type*]
#   Type of the desktop file. Defaults to 'Application'.
#
define shortcut::file
(
    $ensure = 'present',
    $filename = $title,
    $user,
    $comment = '',
    $command,
    $icon,
    $terminal = 'false',
    $type = 'Application'

)
{

    file { $filename:
        ensure => $ensure,
        name => "${::os::params::home}/${user}/.local/share/applications/${filename}.desktop",
        content => template('shortcut/file.erb'),
        owner => $::os::params::adminuser,
        group => $::os::params::admingroup,
        mode => 644,
   }

}
