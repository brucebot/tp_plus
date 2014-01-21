#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "generators/scanner.rex".
#++

require 'racc/parser'
class TPPlus::Scanner < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    return if @ss.eos?

    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil, :label
      case
      when (text = @ss.scan(/\#.*(?=\n?$)/i))
         action { [:COMMENT, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)(true|false)(?=[\W]+|\A|\z|@)/i))
         action { [:TRUE_FALSE, text] }

      when (text = @ss.scan(/R(?=\[)/i))
         action { [:NUMREG, text] }

      when (text = @ss.scan(/P(?=\[)/i))
         action { [:POSITION, text] }

      when (text = @ss.scan(/PR(?=\[)/i))
         action { [:POSREG, text] }

      when (text = @ss.scan(/VR(?=\[)/i))
         action { [:VREG, text] }

      when (text = @ss.scan(/SR(?=\[)/i))
         action { [:SREG, text] }

      when (text = @ss.scan(/AR(?=\[)/i))
         action { [:ARG, text] }

      when (text = @ss.scan(/F(?=\[)/i))
         action { [:OUTPUT, text] }

      when (text = @ss.scan(/DO(?=\[)/i))
         action { [:OUTPUT, text] }

      when (text = @ss.scan(/RO(?=\[)/i))
         action { [:OUTPUT, text] }

      when (text = @ss.scan(/UO(?=\[)/i))
         action { [:OUTPUT, text] }

      when (text = @ss.scan(/SO(?=\[)/i))
         action { [:OUTPUT, text] }

      when (text = @ss.scan(/DI(?=\[)/i))
         action { [:INPUT, text] }

      when (text = @ss.scan(/RI(?=\[)/i))
         action { [:INPUT, text] }

      when (text = @ss.scan(/UI(?=\[)/i))
         action { [:INPUT, text] }

      when (text = @ss.scan(/SI(?=\[)/i))
         action { [:INPUT, text] }

      when (text = @ss.scan(/\=\=/i))
         action { [:EEQUAL, text] }

      when (text = @ss.scan(/\=/i))
         action { [:EQUAL, text] }

      when (text = @ss.scan(/\:\=/i))
         action { [:ASSIGN, text] }

      when (text = @ss.scan(/\<\>|\!\=/i))
         action { [:NOTEQUAL, text] }

      when (text = @ss.scan(/\>\=/i))
         action { [:GTE, text] }

      when (text = @ss.scan(/\<\=/i))
         action { [:LTE, text] }

      when (text = @ss.scan(/\</i))
         action { [:LT, text] }

      when (text = @ss.scan(/\>/i))
         action { [:GT, text] }

      when (text = @ss.scan(/\+/i))
         action { [:PLUS, text] }

      when (text = @ss.scan(/\-/i))
         action { [:MINUS, text] }

      when (text = @ss.scan(/\*/i))
         action { [:STAR, text] }

      when (text = @ss.scan(/\//i))
         action { [:SLASH, text] }

      when (text = @ss.scan(/DIV/i))
         action { [:DIV, text] }

      when (text = @ss.scan(/&&/i))
         action { [:AND, text] }

      when (text = @ss.scan(/\|\|/i))
         action { [:OR, text] }

      when (text = @ss.scan(/\%/i))
         action { [:MOD, text] }

      when (text = @ss.scan(/\@/i))
         action { @state = :label; [:AT_SYM, text] }

      when((state == :label) and (text = @ss.scan(/[\w_0-9]+(?=[\W]+|\A|\z|@)/i)))
         action { @state = nil; [:WORD, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)set_uframe(?=[\W]+|\A|\z|@)/i))
         action { [:FANUC_SET, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)set_skip_condition(?=[\W]+|\A|\z|@)/i))
         action { [:FANUC_SET, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)use_payload(?=[\W]+|\A|\z|@)/i))
         action { [:FANUC_USE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)use_uframe(?=[\W]+|\A|\z|@)/i))
         action { [:FANUC_USE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)use_utool(?=[\W]+|\A|\z|@)/i))
         action { [:FANUC_USE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)after(?=[\W]+|\A|\z|@)/i))
         action { [:AFTER, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)at(?=[\W]+|\A|\z|@)/i))
         action { [:AT, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)case(?=[\W]+|\A|\z|@)/i))
         action { [:CASE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)circular_move(?=[\W]+|\A|\z|@)/i))
         action { [:MOVE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)else(?=[\W]+|\A|\z|@)/i))
         action { [:ELSE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)end(?=[\W]+|\A|\z|@)/i))
         action { [:END, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)eval(?=[\W]+|\A|\z|@)/i))
         action { [:EVAL, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)for(?=[\W]+|\A|\z|@)/i))
         action { [:FOR, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)if(?=[\W]+|\A|\z|@)/i))
         action { [:IF, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)indirect(?=[\W]+|\A|\z|@)/i))
         action { [:INDIRECT, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)in(?=[\W]+|\A|\z|@)/i))
         action { [:IN, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)joint_move(?=[\W]+|\A|\z|@)/i))
         action { [:MOVE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)jump_to(?=[\W]+|\A|\z|@)/i))
         action { [:JUMP, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)linear_move(?=[\W]+|\A|\z|@)/i))
         action { [:MOVE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)namespace(?=[\W]+|\A|\z|@)/i))
         action { [:NAMESPACE, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)offset(?=[\W]+|\A|\z|@)/i))
         action { [:OFFSET, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)skip_to(?=[\W]+|\A|\z|@)/i))
         action { [:SKIP, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)term(?=[\W]+|\A|\z|@)/i))
         action { [:TERM, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)time_after(?=[\W]+|\A|\z|@)/i))
         action { [:TIME_SEGMENT, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)time_before(?=[\W]+|\A|\z|@)/i))
         action { [:TIME_SEGMENT, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)timeout_to(?=[\W]+|\A|\z|@)/i))
         action { [:TIMEOUT, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)toggle(?=[\W]+|\A|\z|@)/i))
         action { [:IO_METHOD, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)turn_on|turn_off(?=[\W]+|\A|\z|@)/i))
         action { [:IO_METHOD, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)to(?=[\W]+|\A|\z|@)/i))
         action { [:TO, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)unless(?=[\W]+|\A|\z|@)/i))
         action { [:UNLESS, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)wait_for(?=[\W]+|\A|\z|@)/i))
         action { [:WAIT_FOR, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)wait_until(?=[\W]+|\A|\z|@)/i))
         action { [:WAIT_UNTIL, text] }

      when (text = @ss.scan(/(?=[\W]+|\A|\z|@)when(?=[\W]+|\A|\z|@)/i))
         action { [:WHEN, text] }

      when (text = @ss.scan(/\r?\n/i))
         action { [:NEWLINE, text] }

      when (text = @ss.scan(/;/i))
         action { [:SEMICOLON, text] }

      when (text = @ss.scan(/\d+\.\d+|\.\d+/i))
         action { [:REAL, text.to_f] }

      when (text = @ss.scan(/\./i))
         action { [:DOT, text] }

      when (text = @ss.scan(/\d+/i))
         action { [:DIGIT, text.to_i] }

      when (text = @ss.scan(/\!/i))
         action { [:BANG, text] }

      when (text = @ss.scan(/\s+/i))
        ;

      when (text = @ss.scan(/[\w\?_]+/i))
         action { [:WORD, text] }

      when (text = @ss.scan(/"([^\n\r\f"]|\n|\r\n|\r|\f|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s])?|\\[^\n\r\f0-9A-Fa-f])*"|'([^\n\r\f']|\n|\r\n|\r|\f|[^\0-\177]|\\[0-9A-Fa-f]{1,6}(\r\n|[\s])?|\\[^\n\r\f0-9A-Fa-f])*'/i))
         action { [:STRING, text[1,text.length-2]] }

      when (text = @ss.scan(/./i))
         action { [text, text] }

      
      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

end # class

if __FILE__ == $0
  exit  if ARGV.size != 1
  filename = ARGV.shift
  rex = TPPlus::Scanner.new
  begin
    rex.load_file  filename
    while  token = rex.next_token
      p token
    end
  rescue
    $stderr.printf  "%s:%d:%s\n", rex.filename, rex.lineno, $!.message
  end
end
