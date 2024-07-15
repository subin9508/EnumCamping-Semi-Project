package com.itwill.semiproject.config;



import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
    private static final Logger logger = LoggerFactory.getLogger(WebConfig.class);

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String location = "file:C:/study/workspace_semiproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_project/static/";
        logger.info("Resource location: {}", location);
        registry.addResourceHandler("/static/**")
                .addResourceLocations(location)
                .setCachePeriod(3600)
                .resourceChain(true)
                .addResolver(new PathResourceResolver());
    }
}