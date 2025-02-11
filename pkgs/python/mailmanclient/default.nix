{ stdenv, buildPythonPackage, fetchFromGitLab, httplib2, six }:

buildPythonPackage rec {
  name = "mailmanclient-${version}";
  version = "3.2.1";

  src = fetchFromGitLab {
    owner = "mailman";
    repo = "mailmanclient";
    rev = version;
    sha256 = "13in4lf7vsp9cdbdy0ld5dw4sj3aqn3jjc1fs8hngh7rb12i15j8";
  };

  propagatedBuildInputs = [ httplib2 six ];

  # needs access to mailman REST API
  doCheck = false;

  meta = {
    homepage = "http://www.gnu.org/software/mailman/";
    description = "REST client for driving Mailman 3";
    license = stdenv.lib.licenses.lgpl3;
    platforms = stdenv.lib.platforms.linux;
    maintainers = [ stdenv.lib.maintainers.globin ];
  };
}
