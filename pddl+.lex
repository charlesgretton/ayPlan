/*
  Charles Gretton (2008) says: This is a modified version of the pddl
  lexer presumably written by Simon Cresswell from the Strathclyde
  Planning Group.
  
  s.n.cresswell@durham.ac.uk
  Derek Long

  Srathclyde Planning Group
  http://planning.cis.ac.uk

*/

%{

#include <string>

#include <fstream>
  using std::cin;
  using std::cout;
  using std::cerr;
  using std::istream;
  //using namespace VAL;
  
#ifdef OLD_FLEX
  extern "C" int yywrap();
#endif

%}
%option case-insensitive

char [a-zA-Z_]
digit [0-9]
int -?{digit}*
float -?{digit}+(\.{digit}*)?
string {char}+(-|{char}|{digit})*
whitespace [ \t]+
nl \n
comment ;.*$
at_time "at"{whitespace}{float}

%%
"(" {return OPEN_BRAC;}
")" {return CLOSE_BRAC;}
"[" {return OPEN_SQ;}
"]" {return CLOSE_SQ;}
":requirements" {return REQS;}
":equality" {return EQUALITY;}
":strips" {return STRIPS;}
":adl" {return ADL;}
":typing" {return TYPING;}
":disjunctive-preconditions" {return DISJUNCTIVE_PRECONDS;}
":existential-preconditions" {return EXT_PRECS;}
":universal-preconditions" {return UNIV_PRECS;}
":quantified-preconditions" {return QUANT_PRECS;}
":conditional-effects" {return COND_EFFS;}
":fluents" {return FLUENTS;}
":time" {return TIME;}
":preferences" {return PREFERENCES;}
":constraints" {return CONSTRAINTS;}
":constants" {return CONSTANTS;}
":predicates" {return PREDS;}
":functions" {return FUNCTIONS;}
":types" {return TYPES;}
":durative-actions" {return DURATIVE_ACTIONS;}
":duration-inequalities" {return DURATION_INEQUALITIES;}
":continuous-effects" {return CONTINUOUS_EFFECTS;}
":negative-preconditions" {return NEGATIVE_PRECONDITIONS;}
":derived-predicates" {return DERIVED_PREDICATES;}
":timed-initial-literals" {return TIMED_INITIAL_LITERALS;}
"define" {return DEFINE;}
"domain" {return PDDLDOMAIN;}
":action-costs" {return ACTION_COSTS;}
"number" {return NUMBER;}
":action" {return ACTION;}
":process" {return PROCESS;}
":event" {return EVENT;}
":durative-action" {return DURATIVE_ACTION;}
":derived" {return DERIVED;}
":parameters" {return ARGS;}
":precondition" {return PRE;}
":condition" {return CONDITION;}
":start-precondition" {return START_PRE;}
":end-precondition" {return END_PRE;}
"at start" {return AT_START;}
"at end" {return AT_END;}
"over all" {return OVER_ALL;}
":effect" {return EFFECTS;}
":initial-effect" {return INITIAL_EFFECT;}
":final-effect" {return FINAL_EFFECT;}
":invariant" {return INVARIANT;}
":duration" {return DURATION;}
"and" {return AND;}
"or" {return OR;}
"exists" {return EXISTS;}
"forall" {return FORALL;}
"imply" {return IMPLY;}
"not" {return NOT;}
"when" {return WHEN;}
"either" {return EITHER;}
"problem" {return PROBLEM;}
":domain" {return FORDOMAIN;}
":objects" {return OBJECTS;}
":init" {return INITIALLY;}
":goal" {return GOALS;}
"=" {return EQ;}
":length" {return LENGTH;}
":serial" {return SERIAL;}
":parallel" {return PARALLEL;}
":metric" {return METRIC;}
"minimize" {return MINIMIZE;}
"maximize" {return MAXIMIZE;}
"is-violated" {return ISVIOLATED;}
"#t" {return HASHT;}
"duration" {return DURATION_VAR;}
"total-time" {return TOTAL_TIME;}
^"time" {return TIME;}
"increase"   {return INCREASE;}
"decrease"   {return DECREASE;}
"scale-up"   {return SCALE_UP;}
"scale-down" {return SCALE_DOWN;}
"assign"     {return ASSIGN;}
"preference" {return PREFERENCE;}
"always" {return ALWAYS;}
"sometime" {return SOMETIME;}
"within" {return WITHIN;}
"at-most-once" {return ATMOSTONCE;}
"sometime-after" {return SOMETIMEAFTER;}
"sometime-before" {return SOMETIMEBEFORE;}
"always-within" {return ALWAYSWITHIN;}
"hold-during" {return HOLDDURING;}
"hold-after" {return HOLDAFTER;}
"+" {return PLUS;}
"-" {return HYPHEN;}
"*" {return MUL;}
"/" {return DIV;}
">" {return GREATER;}
">=" {return GREATEQ;}
"<" {return LESS;}
"<=" {return LESSEQ;}
"?" {return Q;}
":" {return COLON;}

{at_time} {unsigned int i;
           for(i = 3;i < strlen(yytext);++i)
           {
           	  if(yytext[i] != '\t' && yytext[i] != ' ') break;
           };
           yylval./*fval*/real = atof(yytext+i);
			return (AT_TIME);
          }


{string} {unsigned int i;
    
	  for(i = 0;i<strlen(yytext);i++)
	      yytext[i] = tolower(yytext[i]);
	  yylval.str = new string(yytext);
    
//           yylval.str = new char[strlen(yytext)+1];
//           strcpy(yylval.str,yytext);
// 	  /*Charles ::Tue Oct 30 14:07:51 EST 2007 :: Not sure why the
// 	   * string is being converted to lower case here...*/
// 	  for(i = 0;i<strlen(yylval.str);i++)
// 	      yylval.str[i] = tolower(yylval.str[i]);
// 	  // If symbol is registered as a function symbol,
// 	  // return token FUNCTION_SYMBOL else return NAME
// 	  //cout << yytext << " " << line_no << "\n";
	  if (false)//current_analysis->func_tab.symbol_probe(yylval.str) != NULL)
	      return FUNCTION_SYMBOL;
	  else
	      return NAME;

}

{whitespace} ;
{comment} ;
{nl} {line_no++;};

{int} {yylval.integer = atoi(yytext);return (INTVAL);}
{float} {yylval.real = atof(yytext);return (FLOATVAL);}

%% 

#ifdef OLD_FLEX
extern "C" {
    int yywrap()
    {
	return 1;
    };
};
#else
int yyFlexLexer::yywrap()
{
	return 1;
}
#endif
