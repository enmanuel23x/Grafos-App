package Echo;
use Dancer ':syntax';

use File::Slurp qw(read_file write_file);

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};
get '/write_json' =>  sub {
  my $filename = config->{dwimmer}{json};
  my $data->{'nodes'}= [
      params->{nodes}
  ];
  
  write_file ($filename, to_json($data)); #Aqui se imprime el archivo JSON para leer por javascript
  redirect '/';
};
get '/dijkstra' =>  sub {
  
};
true;
