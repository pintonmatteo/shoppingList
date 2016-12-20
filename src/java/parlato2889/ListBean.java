package parlato2889;

import java.util.ArrayList;

/**
 * Classe ListBean
 * @author parlato2889
 */
public class ListBean
{
    private ArrayList<String> list;

    public ListBean()
    {
        this.list = new ArrayList<>();
    }

    public ArrayList<String> getList()
    {
        return list;
    }

    public void setList(ArrayList<String> list)
    {
        this.list = list;
    }
    
    public void addElement(String element)
    {
        list.add(element);
    }
    
    public void removeElement(String element)
    {
        int n = list.size();
        for(int i = 0; i < n; i++)
        {
            String s = list.get(i);
            if(s.equals(element))
            {
                list.remove(i);
                break;
            }
        }
    }
    
    public void modifyElement(String oldElement, String newElement)
    {
        int n = list.size();
        for(int i = 0; i < n; i++)
        {
            String s = list.get(i);
            if(s.equals(oldElement))
            {
                list.set(i, newElement);
                break;
            }
        }
    }
    
    public void moveElement(String element, boolean mode)
    {
        for(int i = 0; i < list.size(); i++)
        {
            String s = list.get(i);
            if(mode)
            {
                if(s.equals(element))
                {
                    String temp = list.get(i-1);
                    list.set(i-1, list.get(i));
                    list.set(i, temp);
                }
            }
            else
            {
                if(s.equals(element))
                {
                    String temp = list.get(i+1);
                    System.out.println(list.get(i+1));
                    list.set(i+1, list.get(i));
                    list.set(i, temp);
                    break;
                }
            }
        }
    }
}
