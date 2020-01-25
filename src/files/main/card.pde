
public class card{
  
  //attributs
  
  String m_Di_Title;
  String m_Di_Text;
  String m_BA_Name; //background
  String m_AG_Age; //age perso
  String m_PNJ_Name = "null"; //nom pnj
  
  String m_Ef_effect;
  
  String[] m_C1 = { "null", "null", "null" };
  String[] m_C2 = { "null", "null", "null" };
  String[] m_C3 = { "null", "null", "null" };
  String[] m_C4 = { "null", "null", "null" };
  
  PImage m_img;
  
  PVector m_pos = new PVector( 0, 0 );
  
  boolean m_BuffActivateDragging = false;
  PVector m_BuffposMouse = new PVector( 0, 0 );
  
  String m_Id = "";
  float  m_dragLimit = 0.5;
  short m_BuffReturnedAnswer = -1;
  String m_ReturnedAnswer = "-1";
  
  int HAnim = 0;
  int VAnim = 0;
  
  //constructeur
  
  card( String ID )
  {
    m_Id = ID;
    this.load( ID );
    loadSprite();
  }
  
  //methodes
  
  void load( String ID )
  {
    /*m_img = loadImage("assets/cards/"+ID+"/img/img.jpg");*/
    
    try{
    String[] lines = loadStrings("assets/cards/"+ID+"/index.txt");
    
    int nbObjet = 0;
    println("Fichier de projet trouvé : " + lines.length + " lignes");
    
    for (int i = 0 ; i < lines.length; i++) {
      
    /*println("ligne \""+lines[i]+"\"");*/
    String simpleRead = ""; //ligne buffer
    
    if(lines[i].contains("[") )
    {
      simpleRead = (lines[i].substring(lines[i].indexOf("[")+1, lines[i].indexOf("]"))); //valeure sauvegardée pour une variable enregistrée sous une forme .nom[valeure]
      
      /*simpleRead.substring( 1, simpleRead.length()-2 );*/
     
    }
    
    if( lines[i].contains("DI[") )
    {
      m_Di_Title = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_Di_Text = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.length()-1);
      
      println("m_Di_Title : "+m_Di_Title);
      println("m_Di_Text : "+m_Di_Text);
    }
    
    if( lines[i].contains("EF[") )
    {
      m_Ef_effect = simpleRead.substring(1, simpleRead.length()-1);
      println("m_Ef_effect : "+m_Ef_effect);
    }
    
    if( lines[i].contains("BA[") )
    {
      m_BA_Name = simpleRead.substring(1, simpleRead.length()-1);
      println("m_BA_Name : "+m_BA_Name);
    }
    
    if( lines[i].contains("PNJ[") )
    {
      m_PNJ_Name = simpleRead.substring(1, simpleRead.length()-1);
      println("m_PNJ_Name : "+m_PNJ_Name);
    }
    
    if( lines[i].contains("AG[") ) //age
    {
      m_AG_Age = simpleRead.substring(1, simpleRead.length()-1);
      println("m_AG_Age : "+m_AG_Age);
    };
    
    if( lines[i].contains("C1[") )
    {
      m_C1[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C1[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C1[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C1[0] : "+m_C1[0]);
      println("m_C1[1] : "+m_C1[1]);
      println("m_C1[2] : "+m_C1[2]);
    }
    
    if( lines[i].contains("C2[") )
    {
      m_C2[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C2[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C2[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C2[0] : "+m_C2[0]);
      println("m_C2[1] : "+m_C2[1]);
      println("m_C2[2] : "+m_C2[2]);
    }
    
    if( lines[i].contains("C3[") )
    {
      m_C3[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C3[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C3[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C3[0] : "+m_C3[0]);
      println("m_C3[1] : "+m_C3[1]);
      println("m_C3[2] : "+m_C3[2]);
    }
    
    if( lines[i].contains("C4[") )
    {
      m_C4[0] = simpleRead.substring(1, simpleRead.indexOf(" |"));
      m_C4[1] = simpleRead.substring(simpleRead.indexOf("|")+2, simpleRead.indexOf(" /"));
      m_C4[2] = simpleRead.substring(simpleRead.indexOf("/")+2, simpleRead.length()-1);
      
      println("m_C4[0] : "+m_C4[0]);
      println("m_C4[1] : "+m_C4[1]);
      println("m_C4[2] : "+m_C4[2]);
    }
    
  }
  println("Fin du chargement");
  }
  catch( java.lang.RuntimeException e )
  {
    println("Le fichier de projet a rencontré un problème ou est introuvable.");
  }
  }
  
  public void draw()
  {
    if( m_pos.x != 0 )
      image(CardSpriteArray[HAnim], displayWidth/2-300/2+m_pos.x, displayHeight/2-((float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300)/2+m_pos.y, 300, (float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300);
    if( m_pos.y != 0 )
      image(VCardSpriteArray[VAnim], displayWidth/2-300/2+m_pos.x, displayHeight/2-((float(VCardSpriteArray[0].height)/float(VCardSpriteArray[0].width))*300)/2+m_pos.y, 300, (float(VCardSpriteArray[0].height)/float(VCardSpriteArray[0].width))*300);
    if( m_pos.y == 0 && m_pos.x == 0 )
      image(CardSpriteArray[HAnim], displayWidth/2-300/2+m_pos.x, displayHeight/2-((float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300)/2+m_pos.y, 300, (float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300);
    
    push();
    fill( 0, 0, 0, 0 );
    if( m_pos.x <= -displayWidth/2/2 )
    {
      fill( 0, 0, 0, 250 );
    }
    textAlign(CENTER);
    text(m_C1[0], displayWidth/2-300/2+m_pos.x, displayHeight/2-((float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300)/2+m_pos.y, 300, (float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300);
    text(m_C1[0], displayWidth/2-300/2+m_pos.x, displayHeight/2-((float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300)/2+m_pos.y, 300, (float(CardSpriteArray[0].height)/float(CardSpriteArray[0].width))*300);
    pop();
    /*m_C1[1];*/
    /*String[] m_C2 = { "null", "null", "null" };
    String[] m_C3 = { "null", "null", "null" };
    String[] m_C4 = { "null", "null", "null" };*/
    
    choose();
  }
  
  public String checkChoice()
  {
    return m_ReturnedAnswer;
  }
  
  public void choose()
  {
    if( mousePressed && (mouseButton == LEFT) )
    {
      if( !m_BuffActivateDragging )
      {
        m_BuffposMouse.x = mouseX;
        m_BuffposMouse.y = mouseY;
        m_BuffActivateDragging = true;
      }
       
      if( m_pos.x == 0 && m_pos.y == 0 )
      {
        m_pos.x = mouseX-m_BuffposMouse.x;
        if( m_pos.x == 0 )
          m_pos.y = mouseY-m_BuffposMouse.y;
      }
      
     else if( m_pos.x > 0 && m_pos.y == 0 ||  m_pos.x < 0 && m_pos.y == 0 ) //droite / gauche
     {
        m_pos.x = (mouseX-displayWidth/2)*m_dragLimit;
        HAnim = ( abs( floor (mouseX-displayWidth/2)/((displayWidth/2)/20) ));
        
        if( m_pos.x >= displayWidth/2/2-1 )
        {
          println("Droite C2");
          m_BuffReturnedAnswer = 1;
        }
        else if( m_pos.x <= 1 )
        {
          println("Gauche C1");
          m_BuffReturnedAnswer = 0;
        }
        else
        {
          m_BuffReturnedAnswer = -1;
        }
     }
     else if( m_pos.y > 0 && m_pos.x == 0  || m_pos.y < 0  && m_pos.x == 0) //haut / bas
     {
        m_pos.y = (mouseY-displayHeight/2)*m_dragLimit;
        VAnim = ( abs( ceil ( mouseY-displayHeight/2)/((displayHeight/2)/31) ));
        
        if( m_pos.y >= displayHeight/2/2-1 )
        {
          println("Bas C4");
          m_BuffReturnedAnswer = 3;
        }
        else if( m_pos.y <= 1 )
        {
          println("Haut C3");
          m_BuffReturnedAnswer = 2;
        }
        else
        {
          m_BuffReturnedAnswer = -1;
        }
     }
      
      
    }
    else if( m_BuffReturnedAnswer == -1 )
    {
      m_pos.x = 0;
      m_pos.y = 0;
      m_BuffActivateDragging = false;
      HAnim = 0;
      VAnim = 0;
    }
    else
    {
      println("m_BuffReturnedAnswer : "+ m_BuffReturnedAnswer);
      m_ReturnedAnswer = this.getChoiceID( m_BuffReturnedAnswer );
      println("m_ReturnedAnswer : "+ m_ReturnedAnswer);
      m_pos.x = 0;
      m_pos.y = 0;
      m_BuffActivateDragging = false;
    }
  }
  
  //get methodes
  
  String getDi_Title()
  {
    return m_Di_Title;
  }
  String getDi_Text()
  {
    return m_Di_Text;
  }
  
  String getEf_effect()
  {
    return m_Ef_effect;
  }
  
  String getChoiceTitle( short nb_Choice )
  {
    if( nb_Choice == 0 )
    {
      return m_C1[0];
    }
    else if( nb_Choice == 1 )
    {
      return m_C2[0];
    }
    else if( nb_Choice == 2 )
    {
      return m_C3[0];
    }
    else if( nb_Choice == 3 )
    {
      return m_C4[0];
    }
    else
    {
      return null;
    }
  }
  
  String getChoiceTexte( short nb_Choice )
  {
    if( nb_Choice == 0 )
    {
      return m_C1[1];
    }
    else if( nb_Choice == 1 )
    {
      return m_C2[1];
    }
    else if( nb_Choice == 2 )
    {
      return m_C3[1];
    }
    else if( nb_Choice == 3 )
    {
      return m_C4[1];
    }
    else
    {
      return null;
    }
  }
  
  String getChoiceID( short nb_Choice )
  {
    println("getChoiceID start");
    if( nb_Choice == 0 )
    {
      return m_C1[2];
    }
    else if( nb_Choice == 1 )
    {
      println("getChoiceID end1 : "+m_C2[2]);
      return m_C2[2];
    }
    else if( nb_Choice == 2 )
    {
      return m_C3[2];
    }
    else if( nb_Choice == 3 )
    {
      return m_C4[2];
    }
    else
    {
      return null;
    }
  }
  
  String getID()
  {
      return m_Id;
  }
  
  String getBA_Name()
  {
      return m_BA_Name;
  }
  
  String getAG_Age()
  {
      return m_AG_Age;
  }
  
  String getPNJ_Name()
  {
    return m_PNJ_Name;
  }
  
  
}
