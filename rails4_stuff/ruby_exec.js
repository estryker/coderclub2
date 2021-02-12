/* Generated by Opal 0.7.0.beta4 */
(function(Opal) {
  Opal.dynamic_require_severity = "error";
  var self = Opal.top, $scope = Opal, nil = Opal.nil, $breaker = Opal.breaker, $slice = Opal.slice, $klass = Opal.klass;

  Opal.add_stubs(['$require', '$printf', '$html_escape', '$sprintf', '$eval', '$strip', '$inspect', '$+', '$message', '$join', '$backtrace']);
  self.$require("erb");
  (function($base, $super) {
    function $Kernel(){};
    var self = $Kernel = $klass($base, $super, 'Kernel', $Kernel);

    var def = self.$$proto, $scope = self.$$scope;

    def.$gets_prompt = function(prompt_msg) {
      var self = this;

      return prompt( prompt_msg );
    };

    def.$puts_alert = function(alert_msg) {
      var self = this;

      alert( alert_msg );
      return nil;
    };

    def.$putc = function(c) {
      var self = this;

      return $scope.get('Kernel').$printf("%c", c);
    };

    def.$puts = function(str) {
      var self = this;

      
      document.getElementById('code_output').innerHTML = document.getElementById('code_output').innerHTML + (($scope.get('ERB')).$$scope.get('Util')).$html_escape(str) + "<br>"
      ;
      return nil;
    };

    def.$print = function(str) {
      var self = this;

      
      document.getElementById('code_output').innerHTML = document.getElementById('code_output').innerHTML + (($scope.get('ERB')).$$scope.get('Util')).$html_escape(str)
      ;
      return nil;
    };

    return (def.$printf = function(format, args) {
      var self = this;

      args = $slice.call(arguments, 1);
      
      document.getElementById('code_output').innerHTML = document.getElementById('code_output').innerHTML + (($scope.get('ERB')).$$scope.get('Util')).$html_escape(self.$sprintf(format, args))
      ;
      return nil;
    }, nil) && 'printf';
  })(self, null);
  Opal.Object.$$proto.$ruby_exec = function(code) {
    var self = this, res = nil, code_inspect = nil, e = nil, code_error = nil;

    try {
    try {
    document.getElementById('code_output').innerHTML='';
      res = self.$eval(code.$strip());
      code_inspect = res.$inspect();
      
    console.log("inspect") 
    console.log( code.$strip() )
    console.log( code_inspect )
    document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + "<br> = &gt;" 
    +  (($scope.get('ERB')).$$scope.get('Util')).$html_escape(code_inspect)
    ;
    } catch ($err) {if (Opal.rescue($err, [$scope.get('Exception')])) {e = $err;
      code_error = e.$message()['$+']("\n")['$+'](e.$backtrace().$join(" \n"));
      
    console.log("error")
    console.log(code)
    console.warn(code_error)
    document.getElementById('code_output').innerHTML="<font size=\"3\" color=\"red\">" 
    +  (($scope.get('ERB')).$$scope.get('Util')).$html_escape(code_error) 
    + "</font>"
     ;
      }else { throw $err; }
    }
    } finally {
    nil
    };
  };
  return (Opal.Object.$$proto.$ruby_exec2 = function(code) {
    var self = this, e = nil, code_error = nil;

    try {
    try {
    
    console.log("running Ruby"); 
    console.log(code); 
    
      self.$eval(code.$strip());
      return  
      document.getElementById('code_output').innerHTML= "Success" 
      console.log("Success") 
    ;
    } catch ($err) {if (Opal.rescue($err, [$scope.get('Exception')])) {e = $err;
      code_error = e.$message()['$+']("\n")['$+'](e.$backtrace().$join("\n"));
      
    console.warn("error");
    console.warn(code);
    console.warn(code_error);
    document.getElementById('code_output').innerHTML="<font size=\"3\" color=\"red\">" 
    +  (($scope.get('ERB')).$$scope.get('Util')).$html_escape(code_error) 
    + "</font>"
     ;
      }else { throw $err; }
    }
    } finally {
    nil
    };
  }, nil) && 'ruby_exec2';
})(Opal);
