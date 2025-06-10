package org.example;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URI;
import java.util.Scanner;
import java.awt.Desktop;

public class Main {
    public static void main(String[] args)
    {
        leer_archivos();
    }

    private static void leer_archivos()
    {
        try
        {
            Scanner scanner = new Scanner(System.in);
            System.out.println("Ingrese el nombre del archivo XML");
            String archivoXML = scanner.nextLine();

            System.out.println("Ingrese el nombre del archivo XSL");
            String archivoXSL =scanner.nextLine();
            
            procesarXML(archivoXML,archivoXSL);

        }
        catch (Exception e)
        {
            System.out.println("No se pudeiron leer los archivos");
        }
    }

    private static void procesarXML(String archivoXML, String archivoXSL)
    {
        try
        {
            TransformerFactory factory =TransformerFactory.newInstance();
            Source xslSource =new StreamSource(new File(archivoXSL));
            Transformer transformer=factory.newTransformer(xslSource);

            Source xmlSource =new StreamSource(new File(archivoXML));
            String archivoHTML = archivoXML.replace(".xml",".html");
            FileOutputStream outputStream= new FileOutputStream(archivoHTML);
            Result result=new StreamResult(outputStream);

            transformer.transform(xmlSource,result);

            outputStream.close();

            System.out.println("Archivo HTML generado:"+ archivoHTML);

            abrirNavegador(archivoHTML);



        }
        catch (TransformerConfigurationException e)
        {
            System.out.println("Error en la configuracion XSL: "+ e.getMessage());
        }
        catch (TransformerException e)
        {
            System.out.println("Error durante la trnasformación: "+e.getMessage());
        }
        catch (Exception e)
        {
            System.out.println("Error al procesar archivos:"+e.getMessage());
            System.out.println("Verifique que los archivos existan");
        }
    }

    private static void abrirNavegador(String archivoHTML)
    {
        try
        {
            File archHTML=new File(archivoHTML);

            if (Desktop.isDesktopSupported())
            {
                Desktop desktop= Desktop.getDesktop();
                if (desktop.isSupported(Desktop.Action.BROWSE))
                {
                    URI uri=archHTML.toURI();
                    desktop.browse(uri);
                }
                else
                {
                    abrirConComando(archivoHTML);
                }
            }
            else
            {
                abrirConComando(archivoHTML);
            }
        }
        catch (Exception e)
        {
            System.out.println("No se pudo abrir el navegador, puede abrirlo de forma manual");
        }
    }

    private static void abrirConComando(String archivoHTML)
    {
        try
        {
            String os =System.getProperty("os.name").toLowerCase();
            ProcessBuilder processBuilder;
            if (os.contains("win"))
            {
                processBuilder=new ProcessBuilder("rundll32","url.dll,FileProtocolHandler",archivoHTML);
            }
            else if (os.contains("mac"))
            {
                processBuilder =new ProcessBuilder("open",archivoHTML);
            }
            else
            {
                processBuilder =new ProcessBuilder("xdg-open",archivoHTML);
            }
            processBuilder.start();

        }
        catch (Exception e)
        {
            System.out.println("No se pudo abrir el navegador, puede abrirlo de forma manual");

        }
    }

}