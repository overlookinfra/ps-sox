# Manage sendmail.conf
class sox::sendmail(
  $fixit = false,
) {
  if $::check_sendmail == 'Failed' and $fixit {
    file_line { 'sendmail.conf Addr=127.0.0.1':
      path    => '/etc/mail/sendmail.cf',
      match   => '^O DaemonPortOptions=.*$',
      line    => 'O DaemonPortOptions=Port=smtp,Addr=127.0.0.1, Name=MTA',
    }
  }
}
