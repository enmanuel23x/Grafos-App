package Echo;
use Dancer ':syntax';

use File::Slurp qw(read_file write_file);


get '/' => sub {
    template 'index';
};
get '/write_json' =>  sub {
  my $filename1 = './public/p1.json';
  my $filename2 = './public/p2.json';
  my $filename3 = './public/p3.json';
  my $data->{'nodes'}= analyzestring();
  write_file ($filename1, to_json($data)); #Aqui se imprime el archivo JSON para leer por javascript
 $data->{'nodes'}= [0];
  write_file ($filename3, to_json($data));
  redirect '/';
};
sub analyzestring
{
  my $str = params->{nodes};
  my @words = split (';', $str);
 my @name;
my @source;
my @target;
my @type;
my @distance;
my @s=();
my $st;
my @s2=();
  foreach my $n ( @words) {
    $st = join(" ",$n);
	  @s=split(',', "$st");
    foreach my $n2 ( @s) {
      if(index($n2,"-")!=-1){
			@s2=split('-', $n2);
			if ( grep $_ == @s2[0], @name ){
			}else{
			push(@name,@s2[0]);}
			if ( grep $_ == @s2[1], @name ){
			}else{
			push(@name,@s2[1]);
			}
			push(@source,@s2[0]);
			push(@target,@s2[1]);
		}elsif(index($n2,":")!=-1){
			@s2=split(':', $n2);
			push(@type,@s2[0]);
			push(@distance,@s2[1]);
		}else{
			push(@name,$n2);
			}
    }
    
  }
  return ([$str
      ]
  );
};
get '/dijkstra' =>  sub {
  my $filename1 = './public/p1.json';
  my $filename2 = './public/p2.json';
  my $filename3 = './public/p3.json';
  my $data->{'route'}= analyzestring2();
  write_file ($filename2, to_json($data));
  $data->{'nodes'}= [1];
  write_file ($filename3, to_json($data));
  redirect '/';
};
sub analyzestring2
{
  my $str = params->{ruta};
};
true;
