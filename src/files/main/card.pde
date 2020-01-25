
public class card{
  
  //attributs
  
  String m_Di_Title;
  String m_Di_Text;
  String m_BA_Name; //background
  String m_AG_Age; //age perso
  String m_PNJ_Name; //nom pnj
  
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
  short m_dragLimit = 100;
  short m_BuffReturnedAnswer = -1;
  short m_ReturnedAnswer = -1;
  
  //constructeur
  
  card( String ID )
  {
    m_Id = ID;
    this.load( ID );
  }
  
  //methodes
  
  void load( String ID )
  {
    m_img = loadImage("assets/cards/"+ID+"/img/img.jpg");
    
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
    }
    
    if( lines[i].contains("DI[") )
    {
      m_Di_Title = simpleRead.substring(0, simpleRead.indexOf("|"));
      m_Di_Text = simpleRead.substring(simpleRead.indexOf("|")+1, simpleRead.length());
      
      println("m_Di_Title : "+m_Di_Title);
      println("m_Di_Text : "+m_Di_Text);
    }
    
    if( lines[i].contains("EF[") )
    {
      m_Ef_effect = simpleRead;
      println("m_Ef_effect : "+m_Ef_effect);
    }
    
    if( lines[i].contains("BA[") )
    {
      m_BA_Name = simpleRead;
      println("m_BA_Name : "+m_BA_Name);
    }
    
    if( lines[i].contains("PNJ[") )
    {
      m_PNJ_Name = simpleRead;
      println("m_PNJ_Name : "+m_PNJ_Name);
    }
    
    if( lines[i].contains("AG[") ) //age
    {
      m_AG_Age = simpleRead;
      println("m_AG_Age : "+m_AG_Age);
    };
    
    if( lines[i].contains("C1[") )
    {
      m_C1[0] = simpleRead.substring(0, simpleRead.indexOf("|"));
      m_C1[1] = simpleRead.substring(simpleRead.indexOf("|")+1, simpleRead.indexOf("/"));
      m_C1[2] = simpleRead.substring(simpleRead.indexOf("/")+1, simpleRead.length());
      
      println("m_C1[0] : "+m_C1[0]);
      println("m_C1[1] : "+m_C1[1]);
      println("m_C1[2] : "+m_C1[2]);
    }
    
    if( lines[i].contains("C2[") )
    {
      m_C2[0] = simpleRead.substring(0, simpleRead.indexOf("|"));
      m_C2[1] = simpleRead.substring(simpleRead.indexOf("|")+1, simpleRead.indexOf("/"));
      m_C2[2] = simpleRead.substring(simpleRead.indexOf("/")+1, simpleRead.length());
      
      println("m_C2[0] : "+m_C2[0]);
      println("m_C2[1] : "+m_C2[1]);
      println("m_C2[2] : "+m_C2[2]);
    }
    
    if( lines[i].contains("C3[") )
    {
      m_C3[0] = simpleRead.substring(0, simpleRead.indexOf("|"));
      m_C3[1] = simpleRead.substring(simpleRead.indexOf("|")+1, simpleRead.indexOf("/"));
      m_C3[2] = simpleRead.substring(simpleRead.indexOf("/")+1, simpleRead.length());
      
      println("m_C3[0] : "+m_C3[0]);
      println("m_C3[1] : "+m_C3[1]);
      println("m_C3[2] : "+m_C3[2]);
    }
    
    if( lines[i].contains("C4[") )
    {
      m_C4[0] = simpleRead.substring(0, simpleRead.indexOf("|"));
      m_C4[1] = simpleRead.substring(simpleRead.indexOf("|")+1, simpleRead.indexOf("/"));
      m_C4[2] = simpleRead.substring(simpleRead.indexOf("/")+1, simpleRead.length());
      
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
    image(m_img, displayWidth/2-m_img.width/2+m_pos.x, displayHeight/2-m_img.height/2+m_pos.y);
    
    choose();
  }
  
  public short checkChoice()
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
        m_pos.y = mouseY-m_BuffposMouse.y;
      }
      else if( m_pos.x > 0 ) //droite
      {
        /*println( " --" + str((exp((mouseX-m_BuffposMouse.x)/100))) + " : " + str(mouseX-m_BuffposMouse.x) +"-- ");*/
        if( (exp((mouseX-m_BuffposMouse.x)/100)) < (mouseX-m_BuffposMouse.x)/2 )
        {
          m_pos.x = (mouseX-m_BuffposMouse.x)-(exp((mouseX-m_BuffposMouse.x)/100));
          m_BuffReturnedAnswer = -1;
        }
        else
        {
          //println("DROIT");
          m_BuffReturnedAnswer = 0;
        }
      }
      else if( m_pos.x < 0 ) //dgauche
      {
        if( (exp(abs(mouseX-m_BuffposMouse.x)/100)) < (abs(mouseX-m_BuffposMouse.x))/2 )
        {
          m_pos.x = (mouseX-m_BuffposMouse.x)+(exp(abs(mouseX-m_BuffposMouse.x)/100));
          m_BuffReturnedAnswer = -1;
        }
        else
        {
          //println("GAUCHE");
          m_BuffReturnedAnswer = 1;
        }
      }
      else if( m_pos.y > 0 ) //si on descend
      {
        if( (exp((mouseY-m_BuffposMouse.y)/100)) < ((mouseY-m_BuffposMouse.y))/2 )
        {
          m_pos.y = (mouseY-m_BuffposMouse.y)-(exp((mouseY-m_BuffposMouse.y)/100));
          m_BuffReturnedAnswer = -1;
        }
        else
        {
          //println("BAS");
          m_BuffReturnedAnswer = 3;
        }
      }
      else if( m_pos.y < 0 ) //si on monte
      {
        if( (exp(abs(mouseY-m_BuffposMouse.y)/100)) < (abs(mouseY-m_BuffposMouse.y))/2 )
        {
          m_pos.y = (mouseY-m_BuffposMouse.y)+(exp(abs(mouseY-m_BuffposMouse.y)/100));
          m_BuffReturnedAnswer = -1;
        }
        else
        {
          //println("HAUT");
          m_BuffReturnedAnswer = 2;
        }
      }
      
      /*
      if( m_pos.y < m_dragLimit && m_pos.y > -m_dragLimit && m_pos.x < m_dragLimit && m_pos.x > -m_dragLimit  )
      {
        m_pos.x = (mouseX-m_BuffposMouse.x)/exp(sqrt(m_pos.y*m_pos.y));
        m_pos.y = (mouseY-m_BuffposMouse.y)/exp(sqrt(m_pos.x*m_pos.x));
      }*/
      
      
    }
    else if( m_BuffReturnedAnswer == -1 )
    {
      m_pos.x = 0;
      m_pos.y = 0;
      m_BuffActivateDragging = false;
    }
    else
    {
      m_ReturnedAnswer = m_BuffReturnedAnswer;
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
    if( nb_Choice == 0 )
    {
      return m_C1[2];
    }
    else if( nb_Choice == 1 )
    {
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
