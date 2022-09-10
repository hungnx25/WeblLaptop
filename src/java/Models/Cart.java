/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<Item> items;
    private String LogName;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(String txt, ArrayList<Products> prolist,String logName) {
        items = new ArrayList<>();
        LogName = logName;
        //ton tai cart
        if (txt != null && txt.length() != 0) {
            String[] s = txt.split("|");
            for (String i : s) {
                String[] n = i.split("-");
                String id = n[0];
                int quantity = Integer.parseInt(n[1]);
                Products p = getProductById(id, prolist);
                Item t = new Item(p, quantity, id);
                addItem(t);
            }
        }
    }

    public List<Item> getItems() {
        return items;
    }

    //so luong sp con lai 
    public int getQuantityById(String id) {
        return getItemById(id).getQuantity();
    }

    public Item getItemById(String id) {
        for (Item i : items) {
            if (i.getProduct().getId().equals(id)) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (items == null) {
            items = new ArrayList<>();
            items.add(t);
            return;
        } else {
            if (getItemById(t.getProduct().getId()) != null) {
                Item item = getItemById(t.getProduct().getId());
                item.setQuantity(item.getQuantity() + t.getQuantity());
            } else {
                items.add(t);
            }
        }

    }

    public void removeItem(String id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    
    public int getTotalPay() {
        int t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * Integer.parseInt(i.getPrice()));
        }
        return t;
    }

    private Products getProductById(String id, ArrayList<Products> prolist) {
        for (Products p : prolist) {
            if (p.getId().equals(id)) {
                return p;
            }
        }
        return null;

    }

    public int getSize() {

        if (items != null) {
            return items.size();
        }
        return 0;
    }

}
