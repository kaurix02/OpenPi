package ee.ut.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
@ComponentScan({ "ee.ut.service" })
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("customUserDetailsService")
    UserDetailsService userDetailsService;

    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/", "/registration", "/pizzas").permitAll()
                .antMatchers("/user/**").access("hasRole('USER')")
                .antMatchers("/cart/**").access("hasRole('USER')")
                .antMatchers("/admin/**").access("hasRole('ADMIN')")
                .and().formLogin().loginPage("/login")
                .usernameParameter("email").passwordParameter("password")
                .and().csrf().disable();
                /*.and().csrf()
                .and().exceptionHandling().accessDeniedPage("/");*/
    }
}
