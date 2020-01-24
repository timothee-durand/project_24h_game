
public class card{
  
  //attributs
  
  String m_Di_Title;
  String m_Di_Text;
  
  String m_Ef_effect;
  
  String[] m_C1 = { "", "", "" };
  String[] m_C2 = { "", "", "" };
  String[] m_C3 = { "", "", "" };
  String[] m_C4 = { "", "", "" };
  
  PImage m_img;
  
  //constructeur
  
  card( String ID )
  {
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
    image(m_img, 0, 0);
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
  
  
}
