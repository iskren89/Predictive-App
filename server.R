data(swiss)
print(swiss)
library(shiny)

shinyServer(function(input, output) {
    model <- lm(Fertility ~ Agriculture + Education + Catholic + Infant.Mortality, data = swiss)
    modelpred <- reactive({
        AgrInput<-input$sliderAgr
        EdInput<-input$sliderEd
        CatInput<-input$sliderCat
        MortInput<-input$sliderMort
        predict(model,newdata=data.frame(Agriculture=AgrInput,Education=EdInput,Catholic=CatInput,Infant.Mortality=MortInput))
    })
    output$pred<-renderText({
        round(modelpred(),digits=1)
    })
    output$plotAgr<-renderPlot({
        AgrInput<-input$sliderAgr
        plot(swiss$Agriculture,swiss$Fertility, xlab="Agriculture",
             ylab="Fertility", bty="n",pch=16, xlim=c(0,90), ylim=c(0,120))
        points(AgrInput,modelpred(),col="red",pch=16,cex=2)
    })
    output$plotEd<-renderPlot({
        EdInput<-input$sliderEd
        plot(swiss$Education,swiss$Fertility, xlab="Education",
             ylab="Fertility", bty="n",pch=16, xlim=c(0,60), ylim=c(0,120))
        points(EdInput,modelpred(),col="blue",pch=16,cex=2)
    })
    output$plotCat<-renderPlot({
        CatInput<-input$sliderCat
        plot(swiss$Catholic,swiss$Fertility, xlab="Catholic",
             ylab="Fertility", bty="n",pch=16, xlim=c(0,100), ylim=c(0,120))
        points(CatInput,modelpred(),col="green",pch=16,cex=2)
    })
    output$plotMort<-renderPlot({
        MortInput<-input$sliderMort
        plot(swiss$Infant.Mortality,swiss$Fertility, xlab="Infant.Mortality",
             ylab="Fertility", bty="n",pch=16, xlim=c(10,30), ylim=c(0,120))
        points(MortInput,modelpred(),col="yellow",pch=16,cex=2)
    })
})
