PROJECT_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

OBJS = ProjectTutorial.o

CFLAGS += -g -pg -fprofile-arcs -ftest-coverage
LDFLAGS += -pg -fprofile-arcs -ftest-coverage
EXTRA_CLEAN += ProjectTutorial.gcda ProjectTutorial.gcno $(PROJECT_ROOT)gmon.out
EXTRA_CMDS = rm -rf ProjectTutorial.gcda

all:	ProjectTutorial

ProjectTutorial:	$(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^
	$(EXTRA_CMDS)

%.o:	$(PROJECT_ROOT)%.cpp
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

%.o:	$(PROJECT_ROOT)%.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

clean:
	rm -fr ProjectTutorial $(OBJS) $(EXTRA_CLEAN)
