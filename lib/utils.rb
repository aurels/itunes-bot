require 'lib/string'
require 'lib/enumerable'

module Utils
  
  # Constants ------------------------------------------------------------------
  
  FEAT_WORD_REGEX = /\A(ft|ft\.|feat|feat\.|featuring)\Z/
    
  GENRES_MAPPING = {
    'Rock'              => /\Arock\Z/,
    'Hip Hop'           => /\Ahip(-| )?hop\Z/,
    'Rap Français'      => /\Arap fran(ç|c)ais\Z/,
    'Chanson Française' => /\Achanson fran(ç|c)aise\Z/,
    'Ska'               => /\Aska\Z/,
    'Chanson Populaire' => /\Achanson populaire\Z/,
    'Ska Fanfare'       => /\Aska fanfare\Z/,
    'Electro'           => /\A(e|é)lectro(nic|nique|nik)?\Z/,
    'Latin'             => /\Alatino?\Z/,
    'Dance'             => /\Adance\Z/,
    'R&B'               => /\A(r&b|rnb|r'n'b|r n b)\Z/,
    'Drum & Bass'       => /\A(d&b|dnb|drum and bass|drum & bass|drum n bass)\Z/,
    'Slow'              => /\Aslow\Z/,
    'Disco'             => /\Adisco\Z/,
    'Classic Rock'      => /\A\Z/,
    'Ragga'             => /\Aragga\Z/,
    'House'             => /\Ahouse\Z/,
    'Reggae'            => /\Areggae\Z/,
    'Soundtrack'        => /\A(sound( )?track)|(bande originale)|(bo)|(b.o.)|(b.o)\Z/,
    'Rai'               => /\Ara(i|ï)\Z/,
    'Pop'               => /\Apop\Z/,
    'Techno'            => /\Atechno\Z/,
    'Metal'             => /\Am(e|é)tal\Z/,
    'Easy Listening'    => /\A\Z/,
    'Soul'              => /\Asoul\Z/,
    'Variété'           => /\Avari(e|é)t(e|é)\Z/,
    'Fête'              => /\Af(e|ê)te\Z/,
    'Indie'             => /\Aindie\Z/,
    'Sirtaki'           => /\Asirtaki\Z/,
    'Humour'            => /\Ahumour\Z/,
    'Funk'              => /\Afunk\Z/,
    'Cartoon'           => /\Acartoon\Z/,
    'Turntablism'       => /\Aturntablism\Z/,
    'Punk'              => /\Apunk( rock)?\Z/,
    'Dub Step'          => /\Adub step\Z/,
    'Blues'             => /\Ablues\Z/,
    'Electro Folk'      => /\Aelectro folk\Z/,
    'Salsa'             => /\Asalsa\Z/,
    'Cowboy'            => /\Acowboy\Z/,
    'Comédie Musicale'  => /\Acom(e|é)die musicale\Z/,
    'Classical'         => /\Aclassi(cal|que)\Z/,
    'Zouk'              => /\Azouk\Z/,
    'Ska Punk'          => /\Aska punk\Z/,
    'Folk'              => /\Afolk\Z/,
    'Slam'              => /\Aslam\Z/,
    'Calypso'           => /\Acalypso\Z/,
    'Children’s Music'  => /\A(children(’s)? music|chanson pour enfants?)\Z/,
    'Trip-Hop'          => /\Atrip(-| )?hop\Z/,
    'Polka'             => /\Apolka\Z/,
    'Rap Celtique'      => /\Arap celtique\Z/,
    'Jazz'              => /\Ajazz\Z/,
    'Grunge'            => /\Agrunge\Z/,
    'Rap Cubain'        => /\Arap cubain\Z/,
    'Chorale'           => /\Achorale\Z/,
    'Ska Reggae'        => /\Aska reggae\Z/,
    'Jump Style'        => /\Ajump style\Z/,
    'Gigue'             => /\Agigue\Z/,
    'World Music'       => /\Aworld music\Z/,
    'Vocal'             => /\Avocal\Z/,
    'Classic Rock'      => /\Aclassic rock\Z/,
    'Atmosphere'        => /\Aatmosphere\Z/,
    'Easy Listening'    => /\Aeasy listening\Z/,
  }
  
  UNCAPITALIZABLE_SPECIAL_WORDS = [
    'DJ',
    'DJ\'s',
    'MC',
    'MC\'s'
  ]
  
  CAPITALIZABLE_SPECIAL_WORDS = [
    'à',
    'de',
    'the',
    'and',
    'feat.',
    'ft.',
    'le',
    'la',
    'les',
    'des',
    'du',
    'from',
    'to',
    'a',
    'an',
    'et',
    'au',
    'du',
    'and',
    'as',
    'at',
    'but',
    'by',
    'en',
    'for',
    'from',
    'if',
    'in',
    'into',
    'next',
    'of',
    'off',
    'on',
    'onto',
    'or',
    'out',
    'over',
    'than',
    'the',
    'to',
    'unto',
    'up',
    'upon',
    'via',
    'vs',
    'versus',
    'with',
    'ou',
    'un'
  ]
  
  SPECIAL_WORDS = UNCAPITALIZABLE_SPECIAL_WORDS + CAPITALIZABLE_SPECIAL_WORDS
  
  def self.clean(sentence)
    sentence.sanitize.scan(/([\w|']+)?(-|\ |,|;|\(|\)|\Z)/).collect_with_index do |token, index|
      puts token
      word = token[0].to_s
      sep  = token[1].to_s
      clean_word(word, index == 0) + sep
    end.join('')
  end
  
  def self.clean_word(word, first = false)
    if word.downcase =~ FEAT_WORD_REGEX
      return 'ft.'
    else
      if match = SPECIAL_WORDS.detect { |sw| sw.downcase == word.downcase }
        if first
          if UNCAPITALIZABLE_SPECIAL_WORDS.detect { |usw| usw.downcase == word.downcase }
            return match
          else
            return match.capitalize
          end
        else
          match
        end
      else
        return word.capitalize
      end
    end
  end
end