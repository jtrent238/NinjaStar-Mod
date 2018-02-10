package com.jtrent238.ninjastarmod.common;

import com.jtrent238.ninjastarmod.NinjaStarMod;

import cpw.mods.fml.common.FMLCommonHandler;
import cpw.mods.fml.common.Mod.EventHandler;
import cpw.mods.fml.common.event.FMLInitializationEvent;
import cpw.mods.fml.common.event.FMLServerStartingEvent;
import cpw.mods.fml.common.network.NetworkRegistry;
import cpw.mods.fml.common.network.simpleimpl.MessageContext;
import cpw.mods.fml.common.registry.GameRegistry;
import net.minecraft.entity.player.EntityPlayer;
import net.minecraft.nbt.NBTTagCompound;
import net.minecraft.server.MinecraftServer;
import net.minecraft.tileentity.TileEntity;
import net.minecraftforge.common.MinecraftForge;

public class CommonProxy {
	
	
	private static final String modid = NinjaStarMod.MODID;
	private String owner;
	
	public void init(FMLInitializationEvent e) {
	    //GameRegistry.registerWorldGenerator(new ModWorldGen(), 0);
	    //FMLCommonHandler.instance().bus().register(new MyEventHandler());
        //MinecraftForge.EVENT_BUS.register(new MyEventHandler());
        //System.out.print("common init fired!");
	
		//LogHelper.init();
		}
	
	
	
	public EntityPlayer getPlayerEntityFromContext(MessageContext ctx) {
		return null;
	}
	
	   /**
     * Creates a new NBTTagCompound for the world, with the given NBTTag as the "Player"
     */
    public NBTTagCompound cloneNBTCompound(NBTTagCompound p_76082_1_)
    {
        NBTTagCompound nbttagcompound1 = new NBTTagCompound();
        this.updateTagCompound(nbttagcompound1, p_76082_1_);
        return nbttagcompound1;
    }
    
	public void updateTagCompound(NBTTagCompound p_76064_1_, NBTTagCompound p_76064_2_)
    {
        p_76064_1_.setString(NinjaStarMod.MODID + "." + "modversion", NinjaStarMod.MODVERSION);
        p_76064_1_.setString(NinjaStarMod.MODID + "." + "modname", NinjaStarMod.MODNAME);
        p_76064_1_.setString(NinjaStarMod.MODID + "." + "modid", NinjaStarMod.MODID);
        p_76064_1_.setString(NinjaStarMod.MODID + "." + "modname", NinjaStarMod.MODAUTHOR);
        
        
        if (p_76064_2_ != null)
        {
            p_76064_1_.setTag("Player", p_76064_2_);
        }
    }



	public void registerRenderThings() {
		// TODO Auto-generated method stub
		
	}

}