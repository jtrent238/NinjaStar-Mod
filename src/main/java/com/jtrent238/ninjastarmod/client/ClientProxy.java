package com.jtrent238.ninjastarmod.client;

import com.jtrent238.ninjastarmod.ItemLoader;
import com.jtrent238.ninjastarmod.common.CommonProxy;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_diamond;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_gold;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_iron;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_stone;
import com.jtrent238.ninjastarmod.entity.EntityNinjaStar_wood;
import com.jtrent238.ninjastarmod.items.ItemNinjaStar;
import com.jtrent238.ninjastarmod.render.RenderNinjaStar;

import cpw.mods.fml.client.registry.RenderingRegistry;
import cpw.mods.fml.common.event.FMLInitializationEvent;
import cpw.mods.fml.common.event.FMLPostInitializationEvent;
import cpw.mods.fml.common.eventhandler.EventPriority;
import cpw.mods.fml.common.eventhandler.SubscribeEvent;
import cpw.mods.fml.common.gameevent.TickEvent.PlayerTickEvent;
import net.minecraft.client.Minecraft;
import net.minecraft.client.renderer.entity.RenderSnowball;

public class ClientProxy extends CommonProxy {
  
    private static Minecraft theMinecraft;
 
    // Version checking instance
 	//public static VersionChecker versionChecker;
 	//public static boolean haveWarnedVersionOutOfDate = false;
 
	
 	
	public void init(FMLInitializationEvent e) {
    super.init (e);
    //System.out.print("client init fired!");
    
    // Register client-specific stuff (e.g. renderer & packet-handler callback etc)
  
    

		//ClientRegistry.bindTileEntitySpecialRenderer(TileEntityJenChest.class, new JenChestRenderer());
		//MinecraftForgeClient.registerItemRenderer(Item.getItemFromBlock(BlockLoader.blockJenChest), new ItemRenderJenChest());
		
		//ClientRegistry.bindTileEntitySpecialRenderer(TileEntityPatChest.class, new PatChestRenderer());
		//MinecraftForgeClient.registerItemRenderer(Item.getItemFromBlock(BlockLoader.blockPatChest), new ItemRenderPatChest());
	
		
  }
  

  public void postInit(FMLPostInitializationEvent e) {
	 
	  
  }
  
  
  @SubscribeEvent(priority=EventPriority.NORMAL, receiveCanceled=true)
  public void onEvent(PlayerTickEvent event)
  {
    
    
  }
  
  @Override
  public void registerRenderThings()
  {
	  	/*
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar.class, new RenderSnowball(ItemLoader.ItemNinjaStar, 0));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_wood.class, new RenderSnowball(ItemLoader.ItemNinjaStar, 0));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_stone.class, new RenderSnowball(ItemLoader.ItemNinjaStar, 1));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_iron.class, new RenderSnowball(ItemLoader.ItemNinjaStar, 2));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_gold.class, new RenderSnowball(ItemLoader.ItemNinjaStar, 3));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_diamond.class, new RenderSnowball(ItemLoader.ItemNinjaStar, 4));
   		*/
	    
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_wood.class, new RenderSnowball(ItemLoader.ItemNinjaStar_wood));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_stone.class, new RenderSnowball(ItemLoader.ItemNinjaStar_stone));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_iron.class, new RenderSnowball(ItemLoader.ItemNinjaStar_iron));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_gold.class, new RenderSnowball(ItemLoader.ItemNinjaStar_gold));
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar_diamond.class, new RenderSnowball(ItemLoader.ItemNinjaStar_diamond));
  
  RenderingRegistry.registerEntityRenderingHandler(EntityNinjaStar.class, new RenderSnowball(ItemLoader.ItemNinjaStar_iron));
  
  }

  }
